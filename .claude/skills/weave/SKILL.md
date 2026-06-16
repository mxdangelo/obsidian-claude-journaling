---
name: weave
description: Longitudinal pattern analysis across daily notes. Launched manually only — never auto-runs and is never triggered by another skill. Reads dailies since last_weave, classifies patterns as Evolution / Weaving / New, writes a dated entry to Themes/Weave-Log.md, and distils portraits in People/ and theme notes in Themes/. Use for "weave", "weave my dailies", "look back", "what patterns have been showing up", "read me back to myself".
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
user-invocable: true
---

# /weave

The reflective core. This is the user's space to be read back to themselves. It
is a **mirror**: it describes, surfaces, and quotes — it never scores, ranks,
nags, or prescribes. It may end a thread on an open question; it never ends one
with a "you should."

**This skill is launched by hand only.** It must never auto-run and must never
be triggered from `/daily`, `/weekly`, or any hook.

## 1. Find the window

1. Read `Themes/Weave-Log.md` frontmatter: `last_weave` and `next_weave`.
2. Read all `Daily Notes/*.md` with a date **after `last_weave`**. If `last_weave`
   is empty (first weave), read the last ~14 available dailies.
3. Focus on the `## 📝 Journal` and `## 🌙 Closing` sections; that's where the
   real material is.

## 2. Notice patterns

Read **thematically, not chronologically**. Look for what recurs, what's
shifting, what's surfacing — across people, feelings, tensions, themes, and small
repeated phrases or images. Stay close to what's actually on the page. Don't
import goals or judge against the compass (that's `/senso-tracking`).

## 3. Classify — check the log first

Before calling anything **New**, read the existing entries and theme/people
notes.

- **Evolution** — a thread already in the log that has moved or deepened.
  Describe the movement.
- **Weaving** — a pattern that arises from two or more *existing* threads now
  connecting. Name the threads it comes from.
- **New** — genuinely discontinuous, not reducible to anything earlier.

**From the second run on, Evolution and Weaving are the norm, not the
exception.** "New" everywhere is the signal that you aren't reading the past —
and it has a cost: a pattern that never gets written into the log disappears from
the longitudinal memory and gets mis-classified as New next time. So **register
every significant pattern**, even in one line. Coverage matters more than depth,
because unregistered threads vanish.

## 4. Write the dated entry

Prepend a dated entry to `Themes/Weave-Log.md` (newest first):

```
## YYYY-MM-DD
*Window: <first daily> → <last daily> · N notes*

**<lead pattern>** — <Evolution | Weaving | New>
<Prose, 3–6 lines. Quote real phrases. Interpret the movement, don't list events.>

**<secondary pattern>** — <type>
<1–2 lines. Even very short is fine — the point is that the pattern exists in the log.>
```

Write in the user's language, in the **second person**: "you saw…", "you kept
coming back to…", "you feel…". Never third person — write *"you see the same
thing missing,"* not *"the user sees the same thing missing."* Quote real phrases
from the dailies; don't paraphrase them away. Where a thread stays open, you may
close it with a question rather than a verdict — sparingly, one where it earns
its place, not one per pattern.

Then update the frontmatter: set `last_weave` to today and `next_weave` to today
+ 14 days. `next_weave` is **a reminder, not a trigger** — nothing acts on it.

## 5. Distil into living notes

- **Themes/** — for each pattern written to the log: if `Themes/<Theme>.md`
  exists, append a dated line (1–3 lines, prose, same voice). If it's a new
  pattern that deserves its own note, create it. If it's minor or already
  captured in the log, leave Themes/ alone.
- **People/** — the daily deposits dated **traces** as people come up (see
  `/daily`); `/weave` **distils** them. For each person with new traces since the
  last weave, update the portrait at the top of `People/<Name>.md` (prose,
  anchored to the traces — never invented synthesis), and update or create a
  `## Recurring threads` section if a pattern has formed. Recompute the
  `relationships:` and `themes:` frontmatter from the traces. Same second-person
  voice as the theme notes.

Never invent detail to fill a portrait. If the traces are thin, the note stays
thin. The mirror only reflects what's there.
