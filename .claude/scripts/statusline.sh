#!/usr/bin/env bash
# Optional status-line script for Claude Code: shows ambient vault stats.
# Wire it in .claude/settings.json with a "statusLine" block:
#   "statusLine": { "type": "command", "command": "bash .claude/scripts/statusline.sh" }

VAULT_PATH="${VAULT_PATH:-$(pwd)}"
cd "$VAULT_PATH" 2>/dev/null || exit 0

# Total notes (excluding hidden dirs).
TOTAL_NOTES=$(find "$VAULT_PATH" -name "*.md" -type f -not -path "*/.*" 2>/dev/null | wc -l | tr -d ' ')

# Uncommitted changes, if this is a git repo.
UNCOMMITTED="n/a"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  UNCOMMITTED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
fi

# Whether today's daily exists.
TODAY=$(date +%Y-%m-%d)
if [ -f "$VAULT_PATH/${DAILY_NOTES_DIR:-Daily Notes}/$TODAY.md" ]; then
  TODAY_STATUS="yes"
else
  TODAY_STATUS="no"
fi

echo "Notes: $TOTAL_NOTES | Uncommitted: $UNCOMMITTED | Today's daily: $TODAY_STATUS"
