# Markdown standards

Conventions for how notes in this vault are written and linked. The goal is a
vault that stays legible and link-able without becoming a system of rules.

## Files and names

- Daily notes: `Daily Notes/YYYY-MM-DD.md`.
- Weekly reviews: `Senso/Weekly Review YYYY-Wxx.md` (ISO week, e.g. `2026-W23`).
- Month intentions: `Senso/Month YYYY-MM.md`.
- Projects: `Projects/<Name>/<Name>.md`, where `<Name>` is **PascalCase** (the
  file is named after its folder, e.g. `Projects/Lighthouse/Lighthouse.md`).
- Themes: `Themes/<Theme Name>.md`. People: `People/<Name>.md`.

## Frontmatter

Use YAML frontmatter for machine-read keys only. Keep it minimal. Load-bearing
keys that other tooling parses — **do not rename**:

- `date:` on weekly reviews.
- `last_weave:` / `next_weave:` in `Themes/Weave-Log.md`.
- `allowed-tools:` / `user-invocable:` in skill `SKILL.md` files.

## Links

- Internal links are `[[wiki-links]]` by note title.
- Link liberally between dailies, themes, and people — accretion is the point.
- A link to a note that doesn't exist yet is fine; it marks something worth
  writing later. `/check-links` reports genuinely broken links.

## Tags

- Tags are lightweight and lower-kebab-case: `#theme/identity`, `#person/alex`.
- Prefer linking over tagging when a note already exists for the thing.
- `note-organizer` checks tag consistency against this file.

## Voice and shape

- **Prose over bullets.** Generated content is written in sentences. Use bullets
  only for genuine lists, or when the user themselves writes in bullets.
- Reflective content (`/weave`) is written in the **second person**, in the
  user's language, quoting their own daily phrases.
- Mirror, never prescribe: describe what's there; don't tell the user what to do.

## People notes (two phases)

A `People/<Name>.md` note has frontmatter `tags: [person]`, `relationships: []`,
`themes: []`, an `# <Name>` title, and two sections:

- `## Recurring threads` — the distilled portrait and patterns. Written **only by
  `/weave`**, in prose, second person, anchored to the traces below.
- `## Traces` — dated raw material, appended **only by `/daily`** as people come
  up: `**YYYY-MM-DD** — <what happened, the user's words> [[Daily Notes/YYYY-MM-DD]]`.

Two phases, never crossed: the daily deposits dated traces; the weave distils
them into the portrait. The daily never writes the portrait; the weave never
invents a trace.
