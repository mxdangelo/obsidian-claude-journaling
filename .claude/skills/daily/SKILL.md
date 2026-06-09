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
8. **Posthumous closing** (silent, after the confirmation — the user is writing by now): if the previous daily has day notes written but an empty `## Themes` section, run the **mechanical part** of "Closing the day" on it — populate its `## Themes` and append the People traces, both derivable from its text. Highs & Lows and the reflective sections stay as they are: without the user's words they don't get filled. No separate report: at most one line appended to the confirmation ("also closed yesterday: 2 traces").

## Notes

- Don't call `TaskCreate`. Don't read `Senso/`, `Projects/`, `Themes/` unless the user explicitly asks ("morning routine", "cascade context", "review goals"). The posthumous closing of yesterday's note is the planned exception: there People/Themes are touched.
- Respect the user's writing language: if previous dailies are in a non-English language, write section bodies in the same language. Headers from the template stay as templated.
- If the user asks to update `Agenda.md`, check whether the current day's row is past and move it to the file's Archive section.

## Closing the day

When the user asks to close the day ("close the day", "end of day", etc.), fill the closing sections by **extracting from what they already shared** during the day — don't ask questions:

- `⬆️⬇️ Highs & Lows` — identify the highest and lowest moments from the day's content.
- `### What went well?` — one or two concrete things that emerged from the narrative.
- `### What could be better?` — a self-critique already implicit in what was said.
- `### What did I learn?` — concepts, realizations, insights named during the day.
- `### Energy` (Physical / Mental / Emotional /10) — this isn't extractable: leave it blank without commenting.

## Themes

In the `## Themes` section of the daily, insert only **wiki-links to `Themes/`** — recurring longitudinal patterns (e.g. `[[Themes/Study]]`, `[[Themes/Family]]`). Never link people (those live in `People/` and are already linked in the body of the daily) or single events. The daily frontmatter stays `tags: [daily-note]` unchanged.

## People

When a person appears in the daily with a meaningful passage (a reflection, a significant exchange — not a passing mention), **make sure a profile exists** in `People/`: check the folder, and create `People/[Name].md` if missing. Link them with `[[People/Name|Name]]` only on the **first** mention in the note; later occurrences stay plain text. Then **append a dated trace** to their file under `## Traces` (`**YYYY-MM-DD** — <in the user's words> [[Daily Notes/YYYY-MM-DD]]`).

A People file grows in three layers: a light **portrait** at the top (who they are now, anchored to traces — never invented), **## Recurring threads** (patterns that return, distilled at `/weave`), and **## Traces** (the dated entries). The portrait and threads are distilled by `/weave`, not here — the daily only appends traces.
