---
name: daily
description: Create or open today's daily note. Carry over open tasks from the previous daily.
allowed-tools: Read, Write, Edit, Glob
user-invocable: true
---

# Daily

Create today's daily at `Daily Notes/YYYY-MM-DD.md`. If it exists, open it and show the open tasks to ask the user what to update.

## Steps

1. **Existence check** `Daily Notes/YYYY-MM-DD.md`:
   - Exists → read it, show unchecked tasks, ask the user what to update. STOP.
   - Doesn't exist → continue.
2. **Read** `Templates/Daily Template.md`.
3. **Glob** `Daily Notes/*.md`, take the most recent daily, **Read**.
4. **Extract carry-overs grouped by source section** from the previous daily:
   - Unchecked items under `### 🔴 Must do today`
   - Unchecked items under `### 🏠 Personal`
   - Unchecked items under `### 💼 Work` (skip if it's a `tasks` query block, leave the query intact)
   - Content of `### Tomorrow's priority` (will go into the new Must do today)
5. **Substitute** template placeholders:
   - `{{date}}` → ISO (`YYYY-MM-DD`)
   - `{{date:dddd, MMMM DD, YYYY}}` → e.g. `Wednesday, May 27, 2026`
   - `{{date-1:YYYY-MM-DD}}`, `{{date+1:YYYY-MM-DD}}` → yesterday / tomorrow
   - `{{date:YYYY-[W]WW}}` → ISO week (e.g. `2026-W22`)
   - `{{date:DDD}}` → day of year, `{{date:WW}}` → week number
6. **Fill the new note preserving sections:**
   - `### 🔴 Must do today` ← carry-overs from previous Must do **+** Tomorrow's priority
   - `### 🏠 Personal` ← carry-overs from previous Personal
   - `### 💼 Work` ← carry-overs from previous Work (or leave the `tasks` query block intact)
7. **Write** the file. Brief confirmation to the user.

## Notes

- Don't call `TaskCreate`. Don't read `Senso/`, `Projects/`, `Themes/` unless the user explicitly asks ("morning routine", "cascade context", "review goals").
- Respect the user's writing language: if previous dailies are in a non-English language, write section bodies in the same language. Headers from the template stay as templated.
- If the user asks to update `Agenda.md`, check whether the current day's row is past and move it to the file's Archive section.
