---
name: check-links
description: Scan the vault for broken [[wiki-links]] — links pointing to notes that don't exist. Reports them grouped by source file, with a "did you mean?" suggestion where a near-match exists. Use for "check links", "broken links", "find dead links", "any broken wiki-links?".
allowed-tools: Read, Glob, Grep, Bash
user-invocable: true
---

# /check-links

Find broken `[[wiki-links]]` — links whose target note doesn't exist in the
vault. This is the single source of truth for link-checking; `note-organizer`
defers to it rather than duplicating the check.

## Steps

1. Build the set of existing note titles: every `*.md` filename (without
   extension) across the content folders.
2. Extract every `[[...]]` link from all notes (with `Grep`, pattern like
   `\[\[([^\]|]+)`). Strip any `[[Target|display]]` alias and any
   `[[Target#heading]]` / `[[Target^block-id]]` down to the target title.
3. A link is **broken** if its target title matches no existing note.
4. **Suggest a fix** when a near-match exists: glob `**/*<partial>*.md` and, if a
   similar filename turns up, offer it — e.g. `[[Projet Alpha]] — did you mean
   [[Project Alpha]]?`. If there's no near-match, just report "no matching note".
5. Report broken links **grouped by source file** as `path:line` references, and
   end with a one-line summary: *N broken across M files (of T links checked).*

## Edge cases (skip these — they're not broken links)

- **Embedded attachments** `![[image.png]]` — references to media, not notes.
- **External links** `[text](https://…)` — not wiki-links.
- **Template placeholders** — anything with `{{` in the target.
- **Empty `[[]]`** — report as malformed, not broken.

## Notes

- Skip `.claude/`, `.obsidian/`, and `Templates/` as sources (templates contain
  intentional placeholders).
- A link to a not-yet-written note is a normal part of this vault — report it so
  the user can decide, framed neutrally, not as an error to fix.
- Don't auto-create or auto-fix targets; just report (and suggest).
