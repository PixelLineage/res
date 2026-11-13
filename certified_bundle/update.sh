#!/usr/bin/env bash
# ============================================================
#  update.sh — keybox + fingerprint auto-updater
#  Lives in: res/certified_bundle/
#
#  GitHub Actions: runs automatically, no config needed.
#  Locally:        bash certified_bundle/update.sh
#                  (uses your system git config as-is)
# ============================================================
set -euo pipefail

# Script lives in certified_bundle/ — parent is the res repo root
BUNDLE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$BUNDLE_DIR")"
MUNCH_JSON="$REPO_DIR/munch/23.json"
ALIOTH_JSON="$REPO_DIR/alioth/23.json"
MUNCH_JSON_V2="$REPO_DIR/munch/23-v2.json"
ALIOTH_JSON_V2="$REPO_DIR/alioth/23-v2.json"
TMPDIR_WORK="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_WORK"' EXIT

PIF_URL="https://raw.githubusercontent.com/Vagelis1608/get_the_canary_miner/refs/heads/main/betas/cinnamonbun/bluejay.pif.prop"

log()  { echo "[$(date '+%H:%M:%S')] $*"; }
abort(){ echo "[ABORT] $*"; exit 0; }

# Only configure git identity when running in GitHub Actions (bot user)
# Locally, your own git config is used — nothing to set
if [[ -n "${GITHUB_ACTIONS:-}" ]]; then
    git -C "$REPO_DIR" config user.name  "github-actions[bot]"
    git -C "$REPO_DIR" config user.email "41898282+github-actions[bot]@users.noreply.github.com"
    # Auth: inject GITHUB_TOKEN into remote URL
    REMOTE_URL=$(git -C "$REPO_DIR" remote get-url origin)
    CLEAN_URL=$(echo "$REMOTE_URL" | sed 's|https://[^@]*@|https://|')
    git -C "$REPO_DIR" remote set-url origin \
        "$(echo "$CLEAN_URL" | sed "s|https://|https://x-access-token:${GITHUB_TOKEN}@|")"
fi

cd "$REPO_DIR"

# ============================================================
#  STEP 2 — read current certified version from munch/23.json
# ============================================================
CERTIFIED_VER=$(python3 -c "import json; d=json.load(open('$MUNCH_JSON')); print(d['response'][0]['certified'])")
log "Current certified version: $CERTIFIED_VER"

# ============================================================
#  STEP 3 — download new keybox.xml and compare
# ============================================================
log "Fetching upstream keybox.xml..."
NEW_KEYBOX="$TMPDIR_WORK/keybox.xml"
wget -q --header="User-Agent: Mozilla/5.0" \
  -O "$NEW_KEYBOX" \
  "https://gitea.com/Evolution-X/keybox/raw/branch/main/keybox.xml"

# Fail the run if the source is dead or didn't return a keybox.
if ! grep -q '<Keybox' "$NEW_KEYBOX"; then
    log "ERROR: keybox download failed or is not a keybox"
    exit 1
fi

OUR_KEYBOX="$BUNDLE_DIR/keybox.xml"
KEYBOX_CHANGED=false
if ! cmp -s "$NEW_KEYBOX" "$OUR_KEYBOX"; then
    KEYBOX_CHANGED=true
    log "keybox.xml has changed — will update."
else
    log "keybox.xml unchanged."
fi

# ============================================================
#  STEP 4 — fingerprint update from upstream pif.prop
# ============================================================
OUR_FINGERPRINT_XML="$BUNDLE_DIR/fingerprint.xml"
FP_CHANGED=false

log "Fetching pif.prop..."
PIF="$TMPDIR_WORK/pif.prop"
if ! wget -q -O "$PIF" "$PIF_URL"; then
    log "Could not fetch pif.prop — skipping fingerprint update."
elif ! grep -q '^FINGERPRINT=' "$PIF"; then
    log "pif.prop missing FINGERPRINT — skipping fingerprint update."
else
    NEW_FP=$(grep '^FINGERPRINT='           "$PIF" | head -1 | cut -d= -f2-)
    NEW_SP=$(grep '^SECURITY_PATCH='        "$PIF" | head -1 | cut -d= -f2-)
    NEW_SDK=$(grep '^DEVICE_INITIAL_SDK_INT=' "$PIF" | head -1 | cut -d= -f2-)
    log "Upstream fingerprint: $NEW_FP"
    log "Upstream patch:       $NEW_SP"
    log "Upstream initial SDK: $NEW_SDK"

    OUR_FP=$(python3 -c "import xml.etree.ElementTree as ET; print(ET.parse('$OUR_FINGERPRINT_XML').getroot().findtext('Fingerprint') or '')")

    if [[ "$OUR_FP" == "$NEW_FP" ]]; then
        log "Fingerprint is already up to date."
    else
        log "Fingerprint needs update."
        FP_CHANGED=true
        NEW_VER=$((CERTIFIED_VER + 1))
        python3 - "$OUR_FINGERPRINT_XML" "$NEW_FP" "$NEW_SP" "$NEW_VER" "$NEW_SDK" <<'PY'
import sys
import xml.etree.ElementTree as ET
tree = ET.parse(sys.argv[1])
root = tree.getroot()
root.find('Fingerprint').text = sys.argv[2]
root.find('SecurityPatch').text = sys.argv[3]
root.find('Version').text = sys.argv[4]
if sys.argv[5]:
    root.find('InitialSdk').text = sys.argv[5]
xml_str = ET.tostring(root, encoding='unicode')
with open(sys.argv[1], 'w', encoding='utf-8') as f:
    f.write('<?xml version="1.0" encoding="utf-8"?>\n')
    f.write(xml_str)
    f.write('\n')
print(f"fingerprint.xml updated: version={sys.argv[4]}")
PY
    fi
fi

# ============================================================
#  Bail early if nothing changed
# ============================================================
if [[ "$KEYBOX_CHANGED" == false && "$FP_CHANGED" == false ]]; then
    abort "Nothing changed — no update required."
fi

# ============================================================
#  STEP 5 — Apply keybox update (if changed)
# ============================================================
if [[ "$KEYBOX_CHANGED" == true ]]; then
    log "Replacing keybox.xml..."
    cp "$NEW_KEYBOX" "$OUR_KEYBOX"

    # Bump version if fingerprint step didn't already do it
    if [[ "$FP_CHANGED" == false ]]; then
        NEW_VER=$((CERTIFIED_VER + 1))
        python3 - "$BUNDLE_DIR/fingerprint.xml" "$NEW_VER" <<'PY'
import sys
import xml.etree.ElementTree as ET
tree = ET.parse(sys.argv[1])
root = tree.getroot()
root.find('Version').text = sys.argv[2]
xml_str = ET.tostring(root, encoding='unicode')
with open(sys.argv[1], 'w', encoding='utf-8') as f:
    f.write('<?xml version="1.0" encoding="utf-8"?>\n')
    f.write(xml_str)
    f.write('\n')
print(f"Version bumped to {sys.argv[2]}")
PY
    fi
fi

# ============================================================
#  STEP 6 — Bump certified in both JSON files
# ============================================================
NEW_VER=$((CERTIFIED_VER + 1))
log "Bumping certified: $CERTIFIED_VER -> $NEW_VER"

# Bumps 'certified' on every entry of a manifest, auto-detecting the shape:
#   v1 (legacy):  { "response": [ { ..., "certified": N } ] }
#   v2 (new API): [ { ..., "certified": N } ]
# Missing files are skipped so the script keeps working if a device lacks one.
bump_certified() {
    local file="$1"
    if [[ ! -f "$file" ]]; then
        log "  skip (missing): $file"
        return
    fi
    python3 - "$file" "$NEW_VER" <<'PY'
import sys, json
path, ver = sys.argv[1], int(sys.argv[2])
with open(path) as f:
    d = json.load(f)
entries = d["response"] if isinstance(d, dict) else d
for e in entries:
    e["certified"] = ver
with open(path, "w") as f:
    json.dump(d, f, indent=4)
    f.write("\n")
print(f"{path} certified -> {ver}")
PY
}

bump_certified "$MUNCH_JSON"
bump_certified "$ALIOTH_JSON"
bump_certified "$MUNCH_JSON_V2"
bump_certified "$ALIOTH_JSON_V2"

# ============================================================
#  STEP 7 — Compile certified_bundle.bin
# ============================================================
log "Compiling certified_bundle.bin..."
bash "$BUNDLE_DIR/compile_bundle.sh"
log "Bundle compiled."

# ============================================================
#  STEP 8 — Copy .bin to repo root and push
# ============================================================
cp "$BUNDLE_DIR/certified_bundle.bin" "$REPO_DIR/certified_bundle.bin"

COMMIT_MSG="INTEGRITY: $(TZ='Asia/Kolkata' date '+%b %-d - %-I:%M %p')"
log "Commit message: $COMMIT_MSG"

cd "$REPO_DIR"
git add certified_bundle/keybox.xml \
        certified_bundle/fingerprint.xml \
        certified_bundle.bin \
        munch/23.json \
        alioth/23.json \
        munch/23-v2.json \
        alioth/23-v2.json
git commit -m "$COMMIT_MSG"
git push origin HEAD
log "Pushed. Done! certified=$NEW_VER"
