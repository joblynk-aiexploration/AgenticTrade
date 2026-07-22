#!/usr/bin/env bash
# Notification wrapper. Creates a Task in a ClickUp List.
# Usage: bash scripts/clickup.sh "<message>"
# First line of the message becomes the task title (plain text).
# The full message becomes the task's markdown-rendered description.
# If credentials are unset, appends to a local fallback file.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$ROOT/.env"
FALLBACK="$ROOT/DAILY-SUMMARY.md"

if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

if [[ $# -gt 0 ]]; then
  msg="$*"
else
  msg="$(cat)"
fi

if [[ -z "${msg// /}" ]]; then
  echo "usage: bash scripts/clickup.sh \"<message>\"" >&2
  exit 1
fi

stamp="$(date '+%Y-%m-%d %H:%M %Z')"

if [[ -z "${CLICKUP_API_KEY:-}" || -z "${CLICKUP_LIST_ID:-}" ]]; then
  printf "\n---\n## %s (fallback — ClickUp not configured)\n%s\n" "$stamp" "$msg" >> "$FALLBACK"
  echo "[clickup fallback] appended to DAILY-SUMMARY.md"
  echo "$msg"
  exit 0
fi

payload="$(python3 -c "
import json, re, sys
msg = sys.argv[1]
first_line = msg.splitlines()[0] if msg.splitlines() else msg
name = re.sub(r'^[#>\s\-\*]+', '', first_line)
name = re.sub(r'\*\*', '', name).strip()[:120]
print(json.dumps({'name': name, 'markdown_description': msg}))
" "$msg")"

curl -fsS -X POST \
  "https://api.clickup.com/api/v2/list/$CLICKUP_LIST_ID/task" \
  -H "Authorization: $CLICKUP_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$payload"
echo
