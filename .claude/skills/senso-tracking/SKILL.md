---
name: senso-tracking
description: Coherence mirror between Senso/ (Direzione, Pratiche, the current Month file, recent Weekly Reviews) and what the user actually writes. Surfaces "alive vs declared" and gaps — never judges, never says "do it more". Auto-suggested, not a primary slash command. Triggers on "am I following my practices?", "am I aligned with my Direzione?", "am I living my Senso?", "have I drifted from what I said mattered?", "alive vs declared".
allowed-tools: Read, Glob, Grep, Bash
user-invocable: false
---

# /senso-tracking

A coherence mirror. It holds up what the user **declared** in `Senso/` against
what's **alive** in what they actually write, and surfaces the gap. It is a
mirror, **not a judge**: it names the gap and stops there. It must never say "do
it more," never score adherence, never nag.

## Read the declared

- `Senso/Direzione.md` and `Senso/Pratiche.md` — the compass.
- The current `Senso/Month YYYY-MM.md` if present — this month's intention.
- The most recent one or two `Senso/Weekly Review *.md` — recent commitments.

If `Senso/` is empty or the compass files don't exist, say so plainly and
suggest `/init`. Don't infer a Direzione from the dailies.

## Read the alive

Read recent `Daily Notes/*.md` (a few weeks is enough) for what the user is
actually doing, returning to, and feeling. Stay close to their words.

## Surface, don't sentence

Reflect back, in the user's language and in prose:

- **Alive and declared** — practices and directions that show up in the dailies,
  matching what was named in Senso. Name them; it's worth seeing.
- **Alive but not declared** — things clearly present in daily life that the
  compass doesn't mention. Surface them as an observation, not a correction.
- **Declared but quiet** — things named in Senso that haven't shown up lately.
  Surface the gap neutrally: "you named X; it's been quiet in what you've
  written." Never "you should get back to X."

You may end on an open question. You never end on a prescription. This is a
description of the distance between map and territory — the user decides what,
if anything, to do with it.
