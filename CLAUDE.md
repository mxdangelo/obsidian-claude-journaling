# This vault

A journaling-first personal knowledge system. The daily note is the center of
gravity; everything else emerges from the dailies by accretion. Read this whole
file — it is deliberately short.

## Philosophy (this governs every decision)

- **Mirror, not tracker.** When a skill reflects something back (`/weave`,
  `/senso-tracking`), it *describes and surfaces*. It never scores, ranks, nags,
  or prescribes. No "do it more." No streaks.
- **No artificial layers.** There are no OKRs and no monthly/quarterly cascade.
  Do not invent one.
- **Lean.** Keep auto-loaded context small. Write generated content as **prose**,
  not bullet lists, unless the user themselves writes in bullets.
- **Opt-in over automatic.** Nothing runs on a hidden schedule. `/weave` in
  particular is launched by hand and must never auto-run from another skill.

## The two cores

1. **The daily** (`Daily Notes/YYYY-MM-DD.md`) — where the user writes.
2. **`/weave`** — reads the dailies and weaves longitudinal patterns into
   `Themes/` and `People/`.

Everything else is a service around these two.

## Language

Three Italian signature terms are kept untranslated, like "Zettelkasten":
**Senso**, **Direzione**, **Pratiche**. The folder `Senso/` and the files
`Direzione.md` / `Pratiche.md` stay in Italian. Everything else — folders,
skills, docs, comments — is English. Always respond and generate content in the
user's language; mirror the language they write in.

## Layout

- `Daily Notes/` — `YYYY-MM-DD.md`
- `Senso/` — `Direzione.md`, `Pratiche.md`, `Month YYYY-MM.md`,
  `Weekly Review YYYY-Wxx.md`
- `Projects/<Name>/<Name>.md` — one folder per active project (PascalCase)
- `Themes/` — `Weave-Log.md` and one note per theme
- `People/` — a portrait per recurring person
- `Templates/`, `Archives/` (closed projects → `Archives/Projects/`)
- `Agenda.md` (vault root) — appointments and deadlines, source of truth

## Conventions

Detailed conventions live in `.claude/docs/conventions/`:
`markdown-standards.md`, `productivity-workflow.md`, `project-management.md`,
`task-tracking.md`. Consult them when formatting notes, handling tasks, or
managing projects — don't restate them here.

## Skills

`/daily`, `/weekly`, `/weave`, `/senso-tracking`, `/agenda`, `/project`,
`/push`, `/check-links`, `/search`, `/init`.

## Git

This public vault lives on branch **`main`**. Committing happens once per
session via the SessionStart hook, not on every save. Use `/push` to commit and
push; it checks that `origin` exists and never invents a remote.
