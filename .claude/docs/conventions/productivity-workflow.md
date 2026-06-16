# Productivity workflow

How the pieces fit in daily use. This is descriptive, not prescriptive — the
system asks only that you write a daily note.

## The rhythm

- **Daily** — open `/daily`, capture in the Journal section, check off tasks.
  This is the only thing that needs to happen for the system to work.
- **Weekly (Sunday)** — `/weekly` is the operational planner: it pulls active
  projects, `Agenda.md`, and last week's open loops, and asks you for the one
  thing only. It does **not** reflect on the journal and does **not** run
  `/weave`.
- **Whenever you want to look back** — `/weave`, by hand. This is the reflective
  core. It reads the dailies and weaves patterns into `Themes/` and `People/`.
  It never runs on a schedule and is never triggered by another skill.

## Two cores, everything else a service

The daily and `/weave` are the system. `/agenda`, `/project`, `/push`,
`/search`, `/check-links`, `/senso-tracking` are services that support them.
None of them should grow into a layer that competes with the daily.

## One behaviour worth stating

Committing happens **once per session**, in `session-init.sh` — there is no
auto-commit on every save.
