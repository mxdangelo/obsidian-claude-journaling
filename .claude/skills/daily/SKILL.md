---
name: daily
description: Create or open today's daily note in Daily Notes/YYYY-MM-DD.md, carrying forward unchecked tasks from the previous daily. At end of day, help fill the closing sections. Use for "daily", "today's note", "open my journal", "start my day", "close out the day".
allowed-tools: Read, Write, Edit, Glob, Bash
user-invocable: true
---

# /daily

The center of gravity. Fast to open, asks nothing beyond showing up. **No
cascade context is loaded** — do not read Senso, projects, or goals here. This
is just today's page.

## Open or create today

1. Determine today's date (`YYYY-MM-DD`; `$TODAY` from the session env is fine).
2. If `Daily Notes/YYYY-MM-DD.md` already exists, open it and stop here — show
   the user what's in it (and any open tasks).
3. If it doesn't exist, create it from `Templates/Daily Template.md`, filling the
   placeholders: `{{date}}`, and the `## 🔗 Related` links — yesterday
   (`$YESTERDAY`), tomorrow (today + 1), and this week's review (`Weekly Review
   YYYY-Wxx`).

## Carry forward unchecked tasks

When creating a new daily:

1. Find the **most recent previous** daily note (largest date before today) with
   `Glob` on `Daily Notes/*.md`.
2. Read its `## ✅ Tasks` section and collect every **unchecked** line (`- [ ]`).
   Leave checked lines (`- [x]`) where they are — they're the record.
3. Copy those open task lines into today's `## ✅ Tasks` section.
4. Don't annotate them with age or nag about how long they've been open
   (see `task-tracking.md`).

Optionally call `/agenda` to populate the "📅 Today" line — or just suggest it.

## People — deposit dated traces

When a person comes up in the journal in a way that **counts** (a real exchange,
a reflection — not a passing mention):

1. **Ensure the profile exists** in `People/`: create `People/<Name>.md` if it's
   missing, with frontmatter `tags: [person]`, `relationships: []`, `themes: []`,
   an `# <Name>` title, and empty `## Recurring threads` and `## Traces`
   sections.
2. **Append a dated trace** to the bottom of that file's `## Traces`, in the
   user's words, linking back to today:
   `**YYYY-MM-DD** — <what happened, their words> [[Daily Notes/YYYY-MM-DD]]`

The daily **only deposits traces** — it never writes the portrait or the
recurring threads. `/weave` distils those from the accumulated traces later.
Two phases: the daily lays down the dated raw material; the weave turns it into a
living portrait.

## Closing the day

If the user is closing out the day (end-of-day phrasing, or they ask), fill
`## 🌙 Closing` by **drawing from what they already wrote** — don't interrogate:

- A line or two of prose under **How the day actually went**.
- One line under **One thing worth remembering**.

Keep it light and in the user's words — paraphrase minimally, invent nothing.
This is a journaling page, not a report. Prose, not bullets.
