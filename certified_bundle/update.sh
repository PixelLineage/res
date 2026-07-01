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
# wget with full browser headers passes forgejo bot-protection; curl gets blocked from Actions IPs
# No Accept-Encoding header — avoids receiving raw gzip bytes that break XML parsing
wget -q \
  -O "$NEW_KEYBOX" \
  "https://v15.next.forgejo.org/EvolutionX/keybox/raw/branch/main/keybox.xml"

# Sanity-check: must be valid XML before we do anything with it
if ! head -c 5 "$NEW_KEYBOX" | grep -q '<?xml'; then
    log "keybox.xml download looks invalid (not XML) — skipping keybox update."
    log "First bytes: $(xxd -l 16 "$NEW_KEYBOX" | head -1)"
    KEYBOX_CHANGED=false
else
    OUR_KEYBOX="$BUNDLE_DIR/keybox.xml"
    KEYBOX_CHANGED=false
    if ! cmp -s "$NEW_KEYBOX" "$OUR_KEYBOX"; then
        KEYBOX_CHANGED=true
        log "keybox.xml has changed — will update."
    else
        log "keybox.xml unchanged."
    fi
fi

# ============================================================
#  STEP 4 — fingerprint update via Google Flash Station API
#  We pin to the CANARY track only (previewMetadata.canary == true),
#  never QPR/Beta. Reason: Canary's previewMetadata.id encodes a
#  YYYY-MM tag ("canary-202606") that lines up 1:1 with a real,
#  Google-published monthly Pixel Security Bulletin entry — so we can
#  look up the true SecurityPatch instead of guessing it. QPR/Beta
#  builds carry no such tag and their SPL can lag their compile date
#  by months, which previously caused us to publish a wrong SP.
#  (Same approach as PlayIntegrityFix's autopif.yml.)
#    releaseCandidateName  = build ID  (e.g. ZP11.260515.009)
#    buildId               = numeric   (e.g. 15513807)
#    previewMetadata.id    = canary-YYYYMM (e.g. canary-202606)
#  Fingerprint = google/{product}/{device}:CANARY/{rc}/{numId}:user/release-keys
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

    log "Fetching official Pixel security bulletin..."
    SECBULL_HTML="$TMPDIR_WORK/pixel_secbull.html"
    wget -q -O "$SECBULL_HTML" "https://source.android.com/docs/security/bulletin/pixel" || true

    set +eo pipefail  # API calls may partially fail

    BEST_RC=""; BEST_NUM_ID=""; BEST_PRODUCT=""; BEST_SP=""

    for PRODUCT in bluejay_beta; do
        RAW=$(curl -s \
            --header 'Referer: https://flash.android.com' \
            "https://content-flashstation-pa.googleapis.com/v1/builds?product=${PRODUCT}&key=${APIKEY}")

        # Pick the active Canary build; SP is looked up from the bulletin, not guessed
        WINNER=$(echo "$RAW" | python3 -c "
import json, sys

data = json.load(sys.stdin)
builds = data.get('flashstationBuild', [])

best = None
for b in builds:
    meta = b.get('previewMetadata', {})
    if not (meta.get('active') and meta.get('canary')):
        continue
    rc      = b.get('releaseCandidateName', '')  # e.g. ZP11.260515.009
    num_id  = str(b.get('buildId', ''))          # e.g. 15513807
    prev_id = meta.get('id', '')                 # e.g. canary-202606

    if not prev_id.startswith('canary-') or len(prev_id) != len('canary-') + 6:
        continue
    yyyymm = prev_id[len('canary-'):]
    canary_tag = f'{yyyymm[:4]}-{yyyymm[4:]}'  # -> 2026-06

    best = {'rc': rc, 'num_id': num_id, 'product': b.get('product', ''), 'tag': canary_tag}

if best:
    print(f\"RC={best['rc']}\")
    print(f\"NUMID={best['num_id']}\")
    print(f\"PRODUCT={best['product']}\")
    print(f\"TAG={best['tag']}\")
" 2>/dev/null)

        RC_VAL=$(echo "$WINNER"    | grep '^RC='      | cut -d= -f2-)
        NUMID_VAL=$(echo "$WINNER" | grep '^NUMID='   | cut -d= -f2-)
        PROD_VAL=$(echo "$WINNER"  | grep '^PRODUCT=' | cut -d= -f2-)
        TAG_VAL=$(echo "$WINNER"   | grep '^TAG='     | cut -d= -f2-)

        [[ -z "$RC_VAL" ]] && { log "$PRODUCT: no active canary build found"; continue; }

        # Look up the real SPL for this canary's YYYY-MM tag in the official bulletin.
        # Fall back to the {tag}-05 guess only if the lookup itself fails.
        SP_VAL=$(grep -o "<td>${TAG_VAL}-[0-9][0-9]</td>" "$SECBULL_HTML" 2>/dev/null \
                   | head -1 | sed -e 's;<td>;;' -e 's;</td>;;')
        if [[ -z "$SP_VAL" ]]; then
            log "$PRODUCT: could not find $TAG_VAL in security bulletin — assuming ${TAG_VAL}-05"
            SP_VAL="${TAG_VAL}-05"
        fi
        log "$PRODUCT: best RC=$RC_VAL  SP=$SP_VAL (from bulletin tag $TAG_VAL)"

        if [[ -z "$BEST_SP" || "$SP_VAL" > "$BEST_SP" ]]; then
            BEST_RC="$RC_VAL"; BEST_NUM_ID="$NUMID_VAL"
            BEST_PRODUCT="$PROD_VAL"; BEST_SP="$SP_VAL"
        fi
    done

    set -euo pipefail

    FP_CHANGED=false
    if [[ -z "$BEST_RC" ]]; then
        log "Flash Station API returned no usable active build — skipping fingerprint update."
    else
        # Construct full fingerprint from known parts
        BEST_DEVICE="${BEST_PRODUCT/_beta/}"
        BEST_DEVICE="${BEST_DEVICE/_canary/}"
        NEW_FP="google/${BEST_PRODUCT}/${BEST_DEVICE}:CANARY/${BEST_RC}/${BEST_NUM_ID}:user/release-keys"
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
