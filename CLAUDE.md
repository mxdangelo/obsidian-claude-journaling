# CLAUDE.md

Obsidian + Claude Code vault. Journaling-first PKM system.

## Directory Structure

| Folder | Purpose |
|--------|---------|
| `Daily Notes/` | Daily journal entries (`YYYY-MM-DD.md`) |
| `Senso/` | The compass — `Direzione.md`, `Pratiche.md`, `Monthly YYYY-MM.md`, `Weekly Review YYYY-Wxx.md` |
| `Projects/` | Active projects, each with their own `CLAUDE.md` |
| `Themes/` | Longitudinal patterns — `Weave-Log.md` + one file per theme |
| `People/` | Profiles of the people you interact with |
| `Templates/` | Reusable note structures |
| `Archives/` | Completed/inactive notes |
| `Inbox/` | Uncategorized captures (optional) |
| `.claude/` | System internals — skills, agents, hooks |

## Senso (the backbone)

*Senso* (Italian: "meaning / direction") is the system's compass. Not an OKR cascade. `Direzione` and `Pratiche` are the foundation; Monthly, Weekly Review and Daily Notes are where life actually happens.

```
Senso/Direzione.md             — who I want to be, where I want to be ("direction")
Senso/Pratiche.md              — what I choose to cultivate regularly ("practices")
Senso/Monthly YYYY-MM.md       — intention for the current month
Senso/Weekly Review YYYY-Wxx.md — weekly planning and reflection
Daily Notes/YYYY-MM-DD.md      — the day
```

Each project in `Projects/` can link to `Senso/` elements via `Supports:` in its `CLAUDE.md`.

## Weave — Automatic Check

During `/weekly`: read the frontmatter of `Themes/Weave-Log.md` and check `next_weave`. If the date is today or past, run `/weave` before continuing with the review. Don't ask for confirmation.

## Hooks (automatic, defined in `.claude/settings.json`)

- **SessionStart** (`session-init.sh`) — sets `$VAULT_PATH`, `$TODAY`, `$YESTERDAY`, `$CURRENT_WEEK`. Surfaces the ONE Big Thing from the Weekly Review and flags it if overdue (>7 days).
- **PostToolUse on Write/Edit** (`auto-commit.sh`) — auto-commit on every save.
- **UserPromptSubmit** (`skill-discovery.sh`, 5s timeout) — prompt → skill routing.

## Permissions Model

Claude can write to: `Daily Notes/`, `Senso/`, `Projects/`, `Archives/`, `Templates/`, `Inbox/`, `Themes/`, `People/`.

Claude **cannot** edit `.claude/**` or `.git/**`. Changes to hooks/settings/skills are intentional — explain the why.

## Session Tasks vs Markdown Tasks

**Session tasks** (`TaskCreate`/`TaskUpdate`) are temporary progress spinners visible during a Claude operation — they disappear when the session ends. **Markdown checkboxes** in daily notes are the persistent to-do list. Don't use session tasks to track real work.

## Conventions

Detailed conventions (markdown standards, task tracking, productivity workflow, project management) live in `.claude/docs/conventions/`. Consult on-demand when needed.
