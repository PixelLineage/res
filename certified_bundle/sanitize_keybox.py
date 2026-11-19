#!/usr/bin/env python3
"""Rebuild a keybox.xml from scratch, keeping only the key material.

Upstream keyboxes get watermarked by resellers: stray text between tags
(e.g. base64 "ZXZva2Vycg" between certificates), XML comments
(<!--Telegram@... t.me/...-->), and branding in the DeviceID attribute.

Instead of trying to blacklist each kind of junk, this script parses the
file, pulls out only the -----BEGIN/END----- PEM blocks from each
<PrivateKey> and <Certificate>, and writes a fresh canonical keybox.
Anything else is dropped. It then validates the result with openssl:
  - every PEM decodes to valid DER (catches junk injected *inside* a PEM)
  - private key matches the leaf certificate
  - the certificate chain verifies up to its last (root) certificate

Usage: sanitize_keybox.py <in.xml> <out.xml>
Exits non-zero (and writes nothing) if the keybox is unusable.
"""
import base64
import os
import re
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET

PEM_RE = re.compile(
    r"-----BEGIN ([A-Z ]+)-----(.*?)-----END \1-----", re.DOTALL
)
B64_LINE_RE = re.compile(r"^[A-Za-z0-9+/=]+$")


def die(msg):
    sys.exit(f"sanitize_keybox: {msg}")


def clean_pem(raw, what):
    """Return a canonical PEM string from whatever text the element held."""
    m = PEM_RE.search(raw or "")
    if not m:
        die(f"no PEM block found in {what}")
    label, body = m.group(1), m.group(2)
    lines = [l.strip() for l in body.splitlines() if l.strip()]
    for l in lines:
        if not B64_LINE_RE.match(l):
            die(f"non-base64 junk inside {what}: {l!r}")
    try:
        der = base64.b64decode("".join(lines), validate=True)
    except Exception as e:
        die(f"bad base64 in {what}: {e}")
    b64 = base64.b64encode(der).decode()
    wrapped = "\n".join(b64[i:i + 64] for i in range(0, len(b64), 64))
    return f"-----BEGIN {label}-----\n{wrapped}\n-----END {label}-----"


def openssl(*args, stdin=None):
    r = subprocess.run(["openssl", *args], input=stdin, capture_output=True, text=True)
    return r.returncode, r.stdout + r.stderr


def validate_key(algo, key_pem, certs, tmp):
    for i, c in enumerate(certs):
        rc, out = openssl("x509", "-noout", stdin=c)
        if rc:
            die(f"{algo} cert #{i} is not a valid certificate: {out.strip()}")

    rc, key_pub = openssl("pkey", "-pubout", stdin=key_pem)
    if rc:
        die(f"{algo} private key is invalid: {key_pub.strip()}")
    rc, leaf_pub = openssl("x509", "-pubkey", "-noout", stdin=certs[0])
    if rc or key_pub.strip() != leaf_pub.strip():
        die(f"{algo} private key does not match leaf certificate")

    root = os.path.join(tmp, f"{algo}_root.pem")
    inter = os.path.join(tmp, f"{algo}_inter.pem")
    leaf = os.path.join(tmp, f"{algo}_leaf.pem")
    with open(root, "w") as f:
        f.write(certs[-1] + "\n")
    with open(inter, "w") as f:
        f.write("\n".join(certs[1:-1]) + "\n")
    with open(leaf, "w") as f:
        f.write(certs[0] + "\n")
    args = ["verify", "-CAfile", root]
    if len(certs) > 2:
        args += ["-untrusted", inter]
    rc, out = openssl(*args, leaf)
    if rc:
        die(f"{algo} certificate chain does not verify: {out.strip()}")


def main():
    if len(sys.argv) != 3:
        die("usage: sanitize_keybox.py <in.xml> <out.xml>")
    src, dst = sys.argv[1], sys.argv[2]

    try:
        root = ET.parse(src).getroot()  # default parser drops comments
    except ET.ParseError as e:
        die(f"XML parse error: {e}")

    keys = root.findall(".//Keybox/Key")
    if not keys:
        die("no <Key> elements found")

    out_keys = []
    with tempfile.TemporaryDirectory() as tmp:
        for key in keys:
            algo = (key.get("algorithm") or "").strip().lower()
            if algo not in ("ecdsa", "rsa"):
                die(f"unexpected key algorithm {algo!r}")
            pk = key.find("PrivateKey")
            if pk is None:
                die(f"{algo}: missing <PrivateKey>")
            key_pem = clean_pem("".join(pk.itertext()), f"{algo} PrivateKey")
            certs = [
                clean_pem("".join(c.itertext()), f"{algo} Certificate #{i}")
                for i, c in enumerate(key.findall("CertificateChain/Certificate"))
            ]
            if len(certs) < 2:
                die(f"{algo}: certificate chain too short ({len(certs)})")
            validate_key(algo, key_pem, certs, tmp)
            out_keys.append((algo, key_pem, certs))

    if not any(a == "ecdsa" for a, _, _ in out_keys):
        die("no ecdsa key")

    o = ['<?xml version="1.0"?>', "<AndroidAttestation>",
         "    <NumberOfKeyboxes>1</NumberOfKeyboxes>",
         '    <Keybox DeviceID="keybox">']
    for algo, key_pem, certs in out_keys:
        o.append(f'        <Key algorithm="{algo}">')
        o.append('            <PrivateKey format="pem">')
        o.append(key_pem)
        o.append("            </PrivateKey>")
        o.append("            <CertificateChain>")
        o.append(f"                <NumberOfCertificates>{len(certs)}</NumberOfCertificates>")
        for c in certs:
            o.append('                <Certificate format="pem">')
            o.append(c)
            o.append("                </Certificate>")
        o.append("            </CertificateChain>")
        o.append("        </Key>")
    o += ["    </Keybox>", "</AndroidAttestation>", ""]

    with open(dst, "w") as f:
        f.write("\n".join(o))
    print(f"sanitize_keybox: OK ({', '.join(a for a, _, _ in out_keys)})")


if __name__ == "__main__":
    main()
