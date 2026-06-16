#!/usr/bin/env bash
# UserPromptSubmit hook (5s timeout).
#
# Lightweight router: reads the user's prompt from stdin (JSON) and, if it looks
# like one of the vault's skills would help, prints a short suggestion to stdout
# (which is surfaced to the assistant as context). It only suggests — it never
# invokes anything, and it stays silent when nothing obviously matches.

set -euo pipefail

# Read stdin and pull out the prompt text. Prefer jq; fall back to a grep.
raw="$(cat 2>/dev/null || true)"
if command -v jq >/dev/null 2>&1; then
  prompt="$(printf '%s' "$raw" | jq -r '.prompt // empty' 2>/dev/null || true)"
else
  prompt="$(printf '%s' "$raw" | grep -o '"prompt"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*: *"//; s/"$//' || true)"
fi
[ -z "$prompt" ] && exit 0

# Lowercase for matching.
p="$(printf '%s' "$prompt" | tr '[:upper:]' '[:lower:]')"

suggest=""
case "$p" in
  *"following my practices"*|*"aligned with my direzione"*|*"living my senso"*|*"alive vs declared"*|*"have i drifted"*)
    suggest="/senso-tracking — mirror what you've declared in Senso against what you've actually been writing." ;;
  *weave*|*"look back"*|*"read me back"*|*"patterns"*)
    suggest="/weave — read your dailies and weave longitudinal patterns (run by hand)." ;;
  *"weekly review"*|*"plan my week"*|*"plan the week"*)
    suggest="/weekly — operational planning for the week ahead." ;;
  *"today's note"*|*"open my journal"*|*"start my day"*|*"daily note"*)
    suggest="/daily — open or create today's daily note." ;;
  *agenda*|*appointment*|*deadline*|*"what's coming up"*)
    suggest="/agenda — manage appointments and deadlines in Agenda.md." ;;
  *"new project"*|*"project status"*|*"archive this project"*)
    suggest="/project — create, show status, or archive a project." ;;
  *"broken link"*|*"check links"*|*"dead link"*)
    suggest="/check-links — scan for broken [[wiki-links]]." ;;
  *"search the vault"*|*"grep my notes"*|*"find where i wrote"*)
    suggest="/search — full-text search across the vault." ;;
  *"commit and push"*|*"push to git"*|*"sync to github"*)
    suggest="/push — commit and push (branch main)." ;;
  *"set up my compass"*|*"initialize senso"*|*"first run"*)
    suggest="/init — bootstrap your Direzione and Pratiche." ;;
esac

if [ -n "$suggest" ]; then
  echo "Possibly relevant skill → ${suggest}"
fi

exit 0
