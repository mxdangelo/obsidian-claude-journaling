#!/bin/bash
# Session initialization hook for the journaling-first PKM vault.
# Sets environment variables and surfaces what matters at session start.

# Vault path (defaults to cwd)
export VAULT_PATH="${VAULT_PATH:-$(pwd)}"

# Date variables
export TODAY=$(date +%Y-%m-%d)
export YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d "yesterday" +%Y-%m-%d)
export CURRENT_WEEK=$(date +%Y-W%V)

# Daily note path
export DAILY_NOTE="$VAULT_PATH/${DAILY_NOTES_DIR:-Daily Notes}/$TODAY.md"

# Verify vault structure
if [ ! -f "$VAULT_PATH/CLAUDE.md" ]; then
    echo "Note: Not in a vault root directory (no CLAUDE.md found)"
fi

echo "PKM Session initialized"
echo "  Vault: $VAULT_PATH"
echo "  Today: $TODAY"

# Senso bootstrap check — the compass must exist for /senso-tracking,
# /weekly, /monthly to mean anything. Nudge until the user runs /init.
SENSO_DIR="$VAULT_PATH/${SENSO_DIR:-Senso}"
MISSING_SENSO=""
if [ ! -f "$SENSO_DIR/Direzione.md" ]; then
    MISSING_SENSO="${MISSING_SENSO}Direzione.md "
fi
if [ ! -f "$SENSO_DIR/Pratiche.md" ]; then
    MISSING_SENSO="${MISSING_SENSO}Pratiche.md "
fi
if [ -n "$MISSING_SENSO" ]; then
    echo ""
    echo "  Senso not yet initialized (missing: $MISSING_SENSO)"
    echo "  Run /init to set up your personal compass (Direzione + Pratiche)."
    echo "  Until then, /senso-tracking, /weekly and /monthly have nothing to mirror."
fi

# Surface the most recent Weekly Review's ONE Big Thing, if any
WEEKLY_REVIEW=$(find "$SENSO_DIR" -maxdepth 1 -name "Weekly Review*.md" 2>/dev/null | sort | tail -1)
if [ -n "$WEEKLY_REVIEW" ] && [ -f "$WEEKLY_REVIEW" ]; then
    ONE_BIG_THING=$(grep -A 1 "ONE Big Thing" "$WEEKLY_REVIEW" | tail -1 | sed 's/^[> ]*//' | sed 's/^[[:space:]]*//')
    if [ -n "$ONE_BIG_THING" ]; then
        echo "  ONE Big Thing: $ONE_BIG_THING"
    fi

    # Days since the last weekly review file (by filename date if present, else mtime)
    LAST_REVIEW_DATE=$(echo "$WEEKLY_REVIEW" | grep -oE '[0-9]{4}-W[0-9]{2}' | tail -1)
    if [ -n "$LAST_REVIEW_DATE" ]; then
        # Approximate: parse YYYY-Www to a date (Monday of that week)
        YEAR=$(echo "$LAST_REVIEW_DATE" | cut -d'-' -f1)
        WEEK=$(echo "$LAST_REVIEW_DATE" | sed 's/.*W//')
        # macOS / Linux compatible: compute days from mtime as fallback
        if date -j -f "%Y-%m-%d" "$TODAY" +%s >/dev/null 2>&1; then
            NOW_EPOCH=$(date +%s)
            FILE_EPOCH=$(stat -f %m "$WEEKLY_REVIEW" 2>/dev/null)
        else
            NOW_EPOCH=$(date +%s)
            FILE_EPOCH=$(stat -c %Y "$WEEKLY_REVIEW" 2>/dev/null)
        fi
        if [ -n "$FILE_EPOCH" ]; then
            DAYS_SINCE=$(( (NOW_EPOCH - FILE_EPOCH) / 86400 ))
            if [ "$DAYS_SINCE" -gt 7 ]; then
                echo "  Weekly review overdue ($DAYS_SINCE days since last)"
            fi
        fi
    fi
fi

# Active project count
PROJECTS_DIR_PATH="$VAULT_PATH/${PROJECTS_DIR:-Projects}"
if [ -d "$PROJECTS_DIR_PATH" ]; then
    PROJECT_COUNT=$(find "$PROJECTS_DIR_PATH" -maxdepth 2 -name "CLAUDE.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$PROJECT_COUNT" -gt 0 ]; then
        echo "  Active projects: $PROJECT_COUNT"
    fi
fi
