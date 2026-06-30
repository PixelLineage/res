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
TMPDIR_WORK="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_WORK"' EXIT

UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"

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
# Use curl --compressed so gzip responses are transparently decompressed
# wget with Accept-Encoding: gzip saves raw compressed bytes, breaking XML parsing
curl -s --compressed \
  --user-agent "$UA" \
  --header "Accept: application/xml,text/xml,*/*" \
  --header "Accept-Language: en-US,en;q=0.5" \
  -o "$NEW_KEYBOX" \
  "https://v15.next.forgejo.org/EvolutionX/keybox/raw/branch/main/keybox.xml"

OUR_KEYBOX="$BUNDLE_DIR/keybox.xml"

KEYBOX_CHANGED=false
if ! cmp -s "$NEW_KEYBOX" "$OUR_KEYBOX"; then
    KEYBOX_CHANGED=true
    log "keybox.xml has changed — will update."
else
    log "keybox.xml unchanged."
fi

# ============================================================
#  STEP 4 — fingerprint update via Google Flash Station API
#  No zip download — the API gives us all we need:
#    releaseCandidateName  = build ID  (e.g. CP31.260608.007)
#    buildId               = numeric   (e.g. 15653239)
#    previewMetadata.id    = codename prefix (cinnamonbun → CinnamonBun)
#  Security patch = YYYY-MM-05 from the YYMMDD date in the build ID.
#  Fingerprint = google/{product}/{device}:{codename}/{rc}/{numId}:user/release-keys
# ============================================================
log "Fetching API key from flash.android.com..."
APIKEY=$(curl -s "https://flash.android.com/" \
    | grep -o '<body data-client-config=[^>]*' \
    | cut -d';' -f2 \
    | cut -d'&' -f1 \
    | sed 's/^key=//') || true
if [[ -z "$APIKEY" ]]; then
    log "Could not extract Flash Station API key — skipping fingerprint update."
    FP_CHANGED=false
else
    log "Flash Station API key: ${APIKEY:0:12}..."
    OUR_FINGERPRINT_XML="$BUNDLE_DIR/fingerprint.xml"

    set +eo pipefail  # API calls may partially fail

    BEST_RC=""; BEST_NUM_ID=""; BEST_CODENAME=""; BEST_PRODUCT=""; BEST_SP=""

    for PRODUCT in bluejay_beta; do
        RAW=$(curl -s \
            --header 'Referer: https://flash.android.com' \
            "https://content-flashstation-pa.googleapis.com/v1/builds?product=${PRODUCT}&key=${APIKEY}")

        # Find active build with latest security patch, construct all fields from API data
        WINNER=$(echo "$RAW" | python3 -c "
import json, sys, re

data = json.load(sys.stdin)
builds = data.get('flashstationBuild', [])

CODENAMES = {
    'baklava':     'Baklava',
    'cinnamonbun': 'CinnamonBun',
    'canary':      'Canary',
    'vanilla':     'VanillaIceCream',
}

best = None
for b in builds:
    meta = b.get('previewMetadata', {})
    if not meta.get('active'):
        continue
    rc      = b.get('releaseCandidateName', '')  # e.g. CP31.260608.007
    num_id  = str(b.get('buildId', ''))          # e.g. 15653239
    prev_id = meta.get('id', '')                 # e.g. cinnamonbun-qpr1-beta5

    # Security patch from YYMMDD in build ID (always the 5th of that month)
    m = re.search(r'\.(\d{2})(\d{2})\d{2}\.', rc)
    if not m:
        continue
    sp = f'20{m.group(1)}-{m.group(2)}-05'

    prefix   = prev_id.split('-')[0].lower()
    codename = CODENAMES.get(prefix, prefix.title())

    if best is None or sp > best['sp']:
        best = {'rc': rc, 'num_id': num_id, 'codename': codename,
                'product': b.get('product', ''), 'sp': sp}

if best:
    print(f\"RC={best['rc']}\")
    print(f\"NUMID={best['num_id']}\")
    print(f\"CODENAME={best['codename']}\")
    print(f\"PRODUCT={best['product']}\")
    print(f\"SP={best['sp']}\")
" 2>/dev/null)

        RC_VAL=$(echo "$WINNER"    | grep '^RC='       | cut -d= -f2-)
        NUMID_VAL=$(echo "$WINNER" | grep '^NUMID='    | cut -d= -f2-)
        COD_VAL=$(echo "$WINNER"   | grep '^CODENAME=' | cut -d= -f2-)
        PROD_VAL=$(echo "$WINNER"  | grep '^PRODUCT='  | cut -d= -f2-)
        SP_VAL=$(echo "$WINNER"    | grep '^SP='       | cut -d= -f2-)

        [[ -z "$RC_VAL" ]] && { log "$PRODUCT: no active build found"; continue; }
        log "$PRODUCT: best RC=$RC_VAL  SP=$SP_VAL"

        if [[ -z "$BEST_SP" || "$SP_VAL" > "$BEST_SP" ]]; then
            BEST_RC="$RC_VAL"; BEST_NUM_ID="$NUMID_VAL"
            BEST_CODENAME="$COD_VAL"; BEST_PRODUCT="$PROD_VAL"; BEST_SP="$SP_VAL"
        fi
    done

    set -eo pipefail

    FP_CHANGED=false
    if [[ -z "$BEST_RC" ]]; then
        log "Flash Station API returned no usable active build — skipping fingerprint update."
    else
        # Construct full fingerprint from known parts
        BEST_DEVICE="${BEST_PRODUCT/_beta/}"
        BEST_DEVICE="${BEST_DEVICE/_canary/}"
        NEW_FP="google/${BEST_PRODUCT}/${BEST_DEVICE}:${BEST_CODENAME}/${BEST_RC}/${BEST_NUM_ID}:user/release-keys"
        NEW_SP="$BEST_SP"

        log "New fingerprint: $NEW_FP"
        log "Security patch:  $NEW_SP"

        # Compare against our current build ID (field [3] when split by /)
        OUR_BUILD_ID=$(python3 -c "
import xml.etree.ElementTree as ET
tree = ET.parse('$OUR_FINGERPRINT_XML')
fp = tree.getroot().findtext('Fingerprint') or ''
parts = fp.split('/')
print(parts[3] if len(parts) > 3 else '')
") || true
        log "Our current Build ID: $OUR_BUILD_ID"

        if [[ "$OUR_BUILD_ID" == "$BEST_RC" ]]; then
            log "Fingerprint is already up to date."
        else
            log "Fingerprint needs update: $OUR_BUILD_ID -> $BEST_RC"
            FP_CHANGED=true

            NEW_VER=$((CERTIFIED_VER + 1))
            python3 - "$OUR_FINGERPRINT_XML" "$NEW_FP" "$NEW_SP" "$NEW_VER" <<'PY'
import sys
import xml.etree.ElementTree as ET
tree = ET.parse(sys.argv[1])
root = tree.getroot()
root.find('Fingerprint').text = sys.argv[2]
root.find('SecurityPatch').text = sys.argv[3]
root.find('Version').text = sys.argv[4]
xml_str = ET.tostring(root, encoding='unicode')
with open(sys.argv[1], 'w', encoding='utf-8') as f:
    f.write('<?xml version="1.0" encoding="utf-8"?>\n')
    f.write(xml_str)
    f.write('\n')
print(f"fingerprint.xml updated: version={sys.argv[4]}")
PY
        fi
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

python3 - "$MUNCH_JSON" "$NEW_VER" <<'PY'
import sys, json
with open(sys.argv[1], 'r') as f: d = json.load(f)
d['response'][0]['certified'] = int(sys.argv[2])
with open(sys.argv[1], 'w') as f: json.dump(d, f, indent=4)
print(f"munch/23.json certified -> {sys.argv[2]}")
PY

python3 - "$ALIOTH_JSON" "$NEW_VER" <<'PY'
import sys, json
with open(sys.argv[1], 'r') as f: d = json.load(f)
d['response'][0]['certified'] = int(sys.argv[2])
with open(sys.argv[1], 'w') as f: json.dump(d, f, indent=4)
print(f"alioth/23.json certified -> {sys.argv[2]}")
PY

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
        alioth/23.json
git commit -m "$COMMIT_MSG"
git push origin HEAD
log "Pushed. Done! certified=$NEW_VER"
