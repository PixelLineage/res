#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
keybox_xml="${1:-"$script_dir/keybox.xml"}"
props_xml="${2:-"$script_dir/fingerprint.xml"}"
output_bin="${3:-"$script_dir/certified_bundle.bin"}"

python3 - "$keybox_xml" "$props_xml" "$output_bin" <<'PY'
import base64
import struct
import sys
import xml.etree.ElementTree as ET

MAGIC = b"PLCERT01"

def text(node, name):
    child = node.find(name)
    if child is None or child.text is None or not child.text.strip():
        raise SystemExit(f"missing {name} in {sys.argv[2]}")
    return child.text.strip()

def pem_to_der(pem):
    if "REPLACE_WITH_" in pem:
        raise SystemExit("replace template PEM values before compiling")
    body = "".join(
        line.strip() for line in pem.splitlines()
        if line.strip() and not line.startswith("-----")
    )
    return base64.b64decode(body, validate=True)

def field(data):
    if isinstance(data, str):
        data = data.encode("utf-8")
    return struct.pack("<I", len(data)) + data

keybox = ET.parse(sys.argv[1]).getroot()
props = ET.parse(sys.argv[2]).getroot()

version = int(text(props, "Version"))
fingerprint = text(props, "Fingerprint")
security_patch = text(props, "SecurityPatch")
initial_sdk = text(props, "InitialSdk")

key = keybox.find(".//Key[@algorithm='ecdsa']")
if key is None:
    raise SystemExit("missing ecdsa key in keybox")

private_key = key.find("PrivateKey")
if private_key is None or private_key.text is None:
    raise SystemExit("missing ecdsa private key")

certs = key.findall(".//CertificateChain/Certificate")
if len(certs) < 3:
    raise SystemExit("ecdsa certificate chain must contain at least 3 certs")

payload = bytearray()
payload += MAGIC
payload += struct.pack("<I", version)
payload += field(fingerprint)
payload += field(security_patch)
payload += field(initial_sdk)
payload += field(pem_to_der(private_key.text))
for cert in certs[:3]:
    if cert.text is None:
        raise SystemExit("empty certificate in ecdsa chain")
    payload += field(pem_to_der(cert.text))

with open(sys.argv[3], "wb") as out:
    out.write(payload)

print(f"wrote {sys.argv[3]} version={version} size={len(payload)}")
PY
