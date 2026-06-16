---
name: weekly
description: Planning-focused weekly review (Sundays). Reads active projects, Agenda.md, and open loops from the previous review, then asks the user for the one thing only. Does NOT re-read the daily journal and does NOT trigger /weave. Use for "weekly review", "plan my week", "weekly", "Sunday review".
allowed-tools: Read, Write, Edit, Glob, Bash
user-invocable: true
---

# /weekly

The **operational planner** for the week ahead. Planning-focused, not
reflective. Reflection on the past lives in `/weave` — this skill must **never**
trigger `/weave` and must **never** re-read the daily journal. If the user wants
to look back, point them to `/weave`.

## Create the review

1. Determine the ISO week (`YYYY-Wxx`, e.g. `2026-W23`) and today's date.
2. Create `Senso/Weekly Review YYYY-Wxx.md` from `Templates/Weekly Review
   Template.md` if it doesn't exist. Fill `date:` and the week.

## Gather planning context (only these three sources)

- **Active projects** — read each project file (`Projects/<Name>/<Name>.md`), note current state and
  next actions.
- **`Agenda.md`** — pull appointments and deadlines that fall in the coming week
  into view.
- **Open loops from the previous review** — find the most recent prior
  `Senso/Weekly Review *.md` and carry its `## 🔄 Open loops` (and any unmet
  commitments) into this week's `Open loops`.

Do not read `Daily Notes/`. Do not summarise the past week's mood or patterns.

## The one thing only

Ask the user directly: **"What's the one thing for this week?"** Write their
answer as the bold line under `## 🎯 One thing only`. **Never infer it** — it is
always the user's commitment to name. (session-init.sh parses this heading and
the bold line, so keep both intact and keep it to a single bold line.)

## Fill out the plan

Help the user populate `## 🤝 Commitments`, `## 📅 Critical deadlines` (from
`Agenda.md` + project deadlines that land this week), and the `## 🗓️ Planning
grid` from the gathered context, in their words. Keep it lean and in prose where
prose fits. Fill the `## 🔗 Related` links — current month (`Month YYYY-MM`) and
the previous / next week's review.

## Closing the week

If the user is wrapping a week before starting the next, help write a few lines
of prose under `## 📈 How it went` — operational (did the plan meet reality), not
reflective.
