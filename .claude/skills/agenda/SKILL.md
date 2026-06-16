---
name: agenda
description: Manage Agenda.md at the vault root — the source of truth for appointments and deadlines. Adds appointments inline from natural phrasing, auto-archives past rows, and populates the "📅 Today" line in the daily note. Use for "add to my agenda", "I have a dentist appointment on Friday", "what's on my agenda", "agenda", "schedule", "what's coming up".
allowed-tools: Read, Write, Edit, Bash
user-invocable: true
---

# /agenda

Maintains `Agenda.md` at the vault root. That file is the single source of truth
for time-bound things — appointments and deadlines. Tasks (non-time-bound) stay
in dailies and projects; keep them out of the Agenda (see `task-tracking.md`).

## Add an appointment

From natural phrasing ("dentist Friday at 18:30", "sister's birthday on the
14th", "deadline for the report next Tuesday"):

1. Parse a `YYYY-MM-DD` date (resolve relative dates against today), an optional
   time, the "what", an optional "where / with", and any note.
2. Insert a row into the **Upcoming** table in `Agenda.md`, keeping rows sorted
   by date. Use `—` for an empty time or field.
3. Confirm the row back to the user in one line.

## Auto-archive past rows

Whenever you touch `Agenda.md`, move any **Upcoming** row whose date is before
today into the **Past** table (also sorted by date). Don't delete anything —
past appointments are a record.

## Populate "📅 Today" in the daily

When asked (or when `/daily` calls for it):

1. Read the **Upcoming** rows dated today.
2. Write them as a short prose/line summary under the daily's `## 📅 Today`
   heading. If there's nothing today, say so lightly (or leave it empty).

## Show what's coming up

When the user asks "what's coming up?", "what's this week?", or "/agenda show":
read the **Upcoming** table, filter to rows dated from today through today + 7
days, and show them as a short list grouped by day. Read-only — no edits.

Keep edits surgical: only the Agenda tables and the daily's Today line.
