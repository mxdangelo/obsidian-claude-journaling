---
name: monthly
description: Run the monthly review. Roll up weekly reviews, set the new month's intention in Senso/Monthly.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Monthly

Monthly review focused on the roll-up of the closing month's weekly reviews and the intention for the new month.

## Steps

1. **Identify the current month**: `YYYY-MM`. Check if `Senso/Monthly YYYY-MM.md` exists.
   - Exists → read it, show empty sections, ask the user what to update. STOP.
   - Doesn't exist → continue.
2. **Read** `Templates/Monthly Template.md`.
3. **Check the previous Monthly** (`Senso/Monthly YYYY-MMprev.md`): if its "How it went" section is empty, ask the user to fill it before proceeding with the new month. Don't write it on their behalf.
4. **Glob** `Senso/Weekly Review YYYY-W*.md` for the closing month. **Read** all 4-5 reviews.
5. **Read** `Senso/Direzione.md` and `Senso/Pratiche.md` for alignment context.
6. **Glob** `Themes/*.md` (excluding `Weave-Log.md`) to surface the active themes.
7. **Compose the new Monthly note**:
   - **Theme**: ask the user.
   - **Intention**: ask the user; suggest one based on the trace of the previous month + Direzione/Pratiche.
   - **Critical deadlines**: from `Agenda.md` for the new month.
   - **Open loops**: cross-week patterns from the weekly reviews + unresolved themes.
   - **Weeks**: insert links to the 4-5 weekly reviews of the new month (date placeholders).
8. **Write** the file.

## Notes

- Don't call `TaskCreate`.
- Respect the user's writing language.
- The "How it went" of the closing month belongs in the previous Monthly file, NOT here. If it's missing, ask before continuing — this is opinionated, but the loop matters.
