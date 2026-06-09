---
name: weekly
description: Run the weekly review. Reads dailies of the week, weaves patterns, generates the Senso/Weekly Review note.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Weekly

Weekly review centered on the past week's dailies, active projects, and open loops from last week.

## Steps

1. **Weave check**: read `Themes/Weave-Log.md` frontmatter. If `next_weave` ≤ today, invoke `/weave` first. Don't ask for confirmation.
2. **Identify the current week**: ISO week (`YYYY-Www`). Check if `Senso/Weekly Review YYYY-Www.md` already exists.
   - Exists → read it, show what's filled/unfilled, ask the user what to update. STOP.
   - Doesn't exist → continue.
3. **Read** `Templates/Weekly Review Template.md`.
4. **Glob** `Daily Notes/*.md` for the past 7 days. **Read** them.
5. **Glob** `Projects/*/CLAUDE.md`. **Read** the active ones.
6. **Read** the previous Weekly Review (`Senso/Weekly Review YYYY-Wprev.md`) for "Open loops" and "How it went".
7. **Touch the month file** (`Senso/Monthly YYYY-MM.md`): clear critical deadlines that have passed; add new ones that emerged from `Agenda.md` or projects. If the file doesn't exist, suggest running `/monthly` — don't create it here, and don't write Theme/Intention on the user's behalf.
8. **Compose the new review note**, populating from observed data:
   - **🎯 One thing only**: ask the user (don't infer — this is a commitment).
   - **📅 This week's commitments**: pull from `Agenda.md` (rows of the current week).
   - **Open loops from last week**: incomplete tasks from the previous review + recurring open questions across the dailies.
   - **Critical deadlines**: from `Agenda.md` + project deadlines.
   - **Planning** (Mon-Fri-Weekend): ask the user.
9. **Write** the file. Brief confirmation.

## Notes

- Don't call `TaskCreate`.
- Respect the user's writing language: if the dailies are in a non-English language, write the review in the same language.
- Don't write commitments on the user's behalf — only fill in observable data, ask for prospective parts.
