---
name: init
description: Initialize Senso/ on a fresh vault. Walks through the personal compass (Direzione + Pratiche) conversationally, creating Senso/Direzione.md and Senso/Pratiche.md from templates. Auto-suggested by SessionStart when Senso is empty.
allowed-tools: Read, Write, Glob
user-invocable: true
---

# Init

Bootstrap the system's compass on a brand-new vault. Run once after cloning. Without this, `/senso-tracking`, `/weekly` and `/monthly` have nothing to mirror.

## When to run

- Right after cloning the repo, before the first `/daily`.
- `SessionStart` nudges the user to run it whenever `Senso/Direzione.md` or `Senso/Pratiche.md` are missing.

## Safety check (first)

- If **both** `Senso/Direzione.md` AND `Senso/Pratiche.md` exist → tell the user "Senso is already initialized" and STOP. Never overwrite without explicit confirmation.
- If only one exists → only initialize the missing one. Don't touch the existing file.

## Flow

The point is conversational onboarding — not a questionnaire. Keep it light, in prose, in the user's own voice. The templates' guiding questions are scaffolding to surface what the user already knows about themselves; not a form to fill.

### 1. Direzione (if missing)

Briefly frame it (1 sentence): *Direzione is your compass heading — who you want to be, where you want to be. Not OKRs.*

Then **Read** `Templates/Direzione Template.md` and show the guiding questions to the user (don't dump the whole file). Invite a free-form reply.

Take what they write and compose `Senso/Direzione.md`:
- Preserve the template's section structure and headings.
- Fill the body with the user's words — paraphrase only minimally, never invent.
- If a section has no input yet, leave it as a placeholder (don't auto-generate).

**Write** the file. Confirm briefly.

### 2. Pratiche (if missing)

Same frame (1 sentence): *Pratiche is what you choose to cultivate regularly — practices, not a habit checklist.*

Same flow as Direzione, with `Templates/Pratiche Template.md`.

### 3. Close

One-line confirmation of what was created. Suggest `/daily` to start journaling.

## Notes

- **Never overwrite.** Existing `Direzione.md` / `Pratiche.md` are sacred — they're the user's compass.
- **Respect language.** If the user replies in a non-English language, write the files in that language. Template structure (section headings) stays as-is.
- **No bullets unless the user uses them.** Prose first.
- **Don't pull from `Daily Notes/`** to "infer" Direzione/Pratiche — at first run there's nothing to pull from, and even later, this is for the user to write.
