---
name: agenda
description: Manages Agenda.md — the source of truth for appointments and deadlines in the vault. Auto-invoked when the user mentions appointments, commitments, deadlines, calendar, or when /daily needs to populate "📅 Today". Automatically archives past rows.
allowed-tools: Read, Write, Edit, Glob, Bash
user-invocable: true
---

# Agenda

`Agenda.md` at the vault root is the source of truth for appointments and deadlines. Expected structure:

```markdown
---
date: YYYY-MM-DD
tags: [agenda]
---
# Agenda

## [Month] YYYY

| Day    | Time  | Commitment | Notes |
|--------|-------|------------|-------|
| Wed 27 | 18:00 | ...        | ...   |

## Archive
### [Month] YYYY
| ... | ... | ... | ... |
```

## Behaviors

### 1. Auto-archive past rows

Every time the skill is invoked (explicitly or by `/daily`):

1. Read `Agenda.md`.
2. For each row in the month sections (NOT under Archive), parse the day (e.g. `Wed 27`) + the section's month → absolute date.
3. If the date is < `$TODAY`, move the row to `## Archive` → `### [Month] YYYY` matching subsection. If the subsection doesn't exist, create it in reverse chronological order (most recent months on top).
4. Update the frontmatter `date:` to `$TODAY`.

### 2. Pull into "📅 Today" of the daily

When invoked from `/daily` (or when the user asks "what's on today?"):

1. Read `Agenda.md`.
2. Filter rows with date = `$TODAY`.
3. Format:
   ```
   - **HH:MM — Commitment** *(Notes)*
   ```
   Omit `*(Notes)*` if the Notes cell is empty.
4. If no rows match, show "*No scheduled commitments.*".

### 3. Add inline ad-hoc

If the user writes things like:
- "tomorrow at 3pm dentist"
- "Friday morning meeting with X"
- "on June 12 I'm leaving"
- "add to agenda: ..."

→ Add a row in the correct month section:

1. Determine the absolute date (today + N days, next Friday, etc.).
2. Determine the section `## [Month] YYYY`. If it doesn't exist, create it in chronological order (most recent months at bottom, before Archive).
3. Insert the row in chronological order within the section.
4. Day format: `[3-letter abbr] [day]` (e.g. `Wed 27`, `Thu 28`, `Fri 5`).
5. If the user doesn't specify a time, leave the Time cell with `—`.

### 4. Show upcoming days

If the user asks "what's on this week?" / "upcoming appointments?" / "/agenda show":

1. Read `Agenda.md`.
2. Filter rows with date ∈ [today, today + 7 days].
3. Display as a table or grouped list by day.

## Notes

- Respect the user's writing language: if the existing Agenda.md uses non-English month/day names, match them.
- Don't call `TaskCreate`.
- If `Agenda.md` doesn't exist, do NOT auto-create it — flag to the user and ask.
- Keep columns visually aligned with extra spaces for readability.
