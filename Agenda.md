# Agenda

The source of truth for appointments and deadlines. `/agenda` maintains this
file: it adds rows from natural phrasing, auto-archives rows whose date has
passed (moving them to **Past** below), and reads the **Upcoming** table to
populate the "📅 Today" line in the daily note.

Keep rows sorted by date. Dates are `YYYY-MM-DD`.

## Upcoming

| Date | Time | What | Where / with | Notes |
|------|------|------|--------------|-------|
<!-- SAMPLE ROWS — fictional persona "Alex". Delete these. -->
| 2026-06-05 | 18:30 | Dentist | Dr. Rossi's office | bring the old x-rays |
| 2026-06-09 | 10:00 | Project kickoff call | with the Lighthouse team | prep one-pager first |
| 2026-06-14 | — | Sister's birthday | — | call in the morning |

## Past

| Date | Time | What | Where / with | Notes |
|------|------|------|--------------|-------|
