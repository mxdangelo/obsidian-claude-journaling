#!/usr/bin/env bash
# SessionStart hook.
#
# - Sets date/vault env variables.
# - Surfaces the "one thing only" from the most recent Weekly Review.
# - Prints a neutral "last weekly review: N days ago" line (no overdue nag).
# - Nudges /init if FIRST_RUN exists or Senso/ is empty.
# - Makes ONE git commit of the previous session's changes (commit-once-per-
#   session). This replaces per-save auto-committing — there is no PostToolUse
#   auto-commit anywhere in this vault.
#
# Output on stdout is surfaced to the assistant as session context.

set -euo pipefail

VAULT_PATH="${CLAUDE_PROJECT_DIR:-$(pwd)}"
cd "$VAULT_PATH"

TODAY="$(date +%Y-%m-%d)"
YESTERDAY="$(date -d 'yesterday' +%Y-%m-%d 2>/dev/null || date -v-1d +%Y-%m-%d 2>/dev/null || echo "")"
CURRENT_WEEK="$(date +%Y-W%V)"
export VAULT_PATH TODAY YESTERDAY CURRENT_WEEK

# --- Find the most recent Weekly Review -------------------------------------
latest_review=""
shopt -s nullglob
for f in "Senso/Weekly Review "*.md; do
  latest_review="$f"   # glob expands sorted; last assignment is the latest
done
shopt -u nullglob

one_thing=""
days_line=""
if [ -n "$latest_review" ] && [ -f "$latest_review" ]; then
  # Parse the "one thing only" commitment. Match the heading in English or
  # Italian, then the first bold line beneath it.
  one_thing="$(awk '
    /^##[[:space:]].*One thing only/ { grab=1; next }
    /^##[[:space:]].*Una cosa sola/  { grab=1; next }
    grab && /^\*\*/ {
      line=$0
      gsub(/^\*\*/, "", line); gsub(/\*\*[[:space:]]*$/, "", line)
      print line
      exit
    }
    grab && /^##[[:space:]]/ { exit }   # left the section without finding one
  ' "$latest_review")"

  # Neutral "N days ago" from the date: frontmatter key.
  review_date="$(awk -F': *' '/^date:/ { print $2; exit }' "$latest_review" | tr -d '[:space:]')"
  if [ -n "$review_date" ]; then
    rd_epoch="$(date -d "$review_date" +%s 2>/dev/null || echo "")"
    today_epoch="$(date -d "$TODAY" +%s 2>/dev/null || echo "")"
    if [ -n "$rd_epoch" ] && [ -n "$today_epoch" ]; then
      days=$(( (today_epoch - rd_epoch) / 86400 ))
      days_line="Last weekly review: ${days} day(s) ago."
    fi
  fi
fi

# --- Compose the context block ----------------------------------------------
echo "— Session context —"
echo "Today: ${TODAY}  |  Week: ${CURRENT_WEEK}"

if [ -n "$one_thing" ]; then
  echo "This week's one thing only: ${one_thing}"
fi
if [ -n "$days_line" ]; then
  echo "$days_line"
fi

# Onboarding nudge: FIRST_RUN present, or Senso/ has no markdown yet.
senso_empty=1
if [ -d "Senso" ]; then
  for s in Senso/*.md; do
    [ -e "$s" ] && senso_empty=0 && break
  done
fi
if [ -f "FIRST_RUN" ] || [ "$senso_empty" -eq 1 ]; then
  echo "Your compass isn't set up yet — suggest running /init to write Direzione and Pratiche."
fi

# --- Commit-once-per-session ------------------------------------------------
# Only if this is a git repo and there are uncommitted changes from before.
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
    git add -A >/dev/null 2>&1 || true
    git commit -q -m "Session checkpoint: ${TODAY}" >/dev/null 2>&1 || true
    echo "(Committed the previous session's changes.)"
  fi
fi

exit 0
