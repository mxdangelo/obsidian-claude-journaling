---
name: init
description: First-run bootstrap. Initializes the personal compass on a fresh vault by walking the user conversationally through writing Senso/Direzione.md and Senso/Pratiche.md from their templates, then removes the FIRST_RUN sentinel. Use for "init", "set up my compass", "first run", "get started", "initialize Senso".
allowed-tools: Read, Write, Bash, Glob
user-invocable: true
---

# /init

Initialize `Senso/` on a fresh vault. This walks the user through their personal
compass — **Direzione** and **Pratiche** — and writes the two files from their
own words. It is conversational, not a questionnaire.

## Safety first (the compass is sacred — never overwrite)

Check for `Senso/Direzione.md` and `Senso/Pratiche.md`:

- **Both exist** → say "Senso is already initialized," and **STOP**. Never
  overwrite either file.
- **Only one exists** → initialize **only the missing one**. Don't touch the
  existing file.
- **Neither exists** → initialize both, one at a time.

Track whether you actually create at least one file this run — the final step
depends on it.

## Direzione

1. Frame it in **one sentence**: a compass heading — *who you want to be, where
   you want to be heading*. Not OKRs, not objectives.
2. Read `Templates/Direzione Template.md` and show the user its guiding
   questions.
3. Invite a **free-form reply**. Let them answer however they like; don't
   interrogate.
4. Compose `Senso/Direzione.md` from their words: paraphrase minimally, **never
   invent**, and leave any unanswered section as an empty placeholder. Match
   their language and their shape (prose unless they wrote in bullets).

## Pratiche

Same flow, framed as: *what you choose to cultivate regularly — practices, not a
habit checklist.* Read `Templates/Pratiche Template.md`, show its guiding
questions, invite a free-form reply, and compose `Senso/Pratiche.md` from their
words under the same rules.

## Close

- **Only if at least one file was created this run**, remove the sentinel:
  `rm FIRST_RUN`. (If both already existed and you stopped, leave it.)
- Confirm what was created, and suggest `/daily` as the next step.

## Rules

- Never overwrite an existing compass file — they're sacred.
- Respect the user's language throughout.
- Prose, not bullets, unless the user uses them.
- **Do not infer** Direzione or Pratiche from `Daily Notes/`. The compass comes
  from the user, not from pattern analysis.
