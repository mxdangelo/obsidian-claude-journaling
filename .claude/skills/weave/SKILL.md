---
name: weave
description: Longitudinal analysis of patterns emerging from daily notes. Classifies patterns as Evolution, Weaving, or New, writes to the Weave-Log, and updates Themes/ files. Auto-runs during /weekly if next_weave is due.
allowed-tools: Read, Write, Edit, Glob, Grep
user-invocable: true
---

# Weave — Pattern Analysis

Longitudinal analysis of patterns emerging in the user's daily notes. Auto-runs during `/weekly` if `next_weave` in `Themes/Weave-Log.md` is today or past, or manually with `/weave`.

## Steps

1. Read `Themes/Weave-Log.md` — previous patterns, `last_weave`, `next_weave`.
2. Read all dailies in `Daily Notes/` with date > `last_weave`. On first activation, read the last 14 available notes.
3. Analyze across the corpus — not chronological, thematic. Look for: recurring themes, phrases/images that return, unresolved tensions, connections between distinct areas (work, relationship, body, study), persistent open questions.
4. Classify each pattern:
   - **Evolution** — was in the log, has transformed. Describe the movement.
   - **Weaving** — new, but arises from the combination of 2+ previous patterns. Name the parents.
   - **New** — discontinuous, not reducible to anything before.
5. Write the new entry at the bottom of `Themes/Weave-Log.md`. Register **all** significant patterns — coverage matters more than depth, because unrecorded patterns disappear from longitudinal memory and risk being classified as New in later activations. Use depth proportional to weight:

   ~~~
   ## [Date]
   *Period analyzed: [start] → [end] · [N] notes*

   **[Main pattern name]** — [Type]
   [Prose, 3-6 lines. Quote real phrases verbatim. Interpret the movement, don't list events.]

   **[Secondary pattern name]** — [Type]
   [Prose, 1-2 lines. Very short is fine — what matters is that the pattern exists in the log.]
   ~~~

6. Update `last_weave` = today, `next_weave` = today + 14 days in the frontmatter of `Themes/Weave-Log.md`.
7. For each pattern written to the log: if a `Themes/[Name].md` file already exists, append a short dated note (1-3 lines, prose, same voice). If the pattern is new and deserves its own file, create it with frontmatter `tags: [theme, theme/name]`. If it's minor or already captured in the log, leave `Themes/` unchanged.

8. **People** — For each person with new traces since the last weave: distill the **portrait** at the top of their `People/[Name].md` (light, anchored to the traces — no invented synthesis), and if a pattern emerges, update or create `## Recurring threads`. Recompute the `relations:` and `themes:` links in the frontmatter from the traces and dailies. The dated **traces** are appended by the daily, not the weave: here you only distill. Same voice as the Themes notes.

## Tone

Prose, **second person** — speak to the user ("you noticed", "you feel", "you realize"), the voice of a companion observing alongside them; this applies to the `People/` notes too. Quote real phrases from the dailies — don't paraphrase. Respect the language of the user's daily notes: if they journal in a non-English language, write the analysis in that language too.
