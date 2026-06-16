---
name: search
description: Grep across the vault for a word or phrase, with results grouped by folder. Excludes .claude/, .obsidian/, and Templates/. Use for "search the vault", "find where I wrote about X", "search for", "grep my notes".
allowed-tools: Grep, Glob, Read, Bash
user-invocable: true
---

# /search

Full-text search across the vault's content.

## Steps

1. Take the user's query (a word or phrase; case-insensitive by default). Use a
   little surrounding context (`-C 1`) so matches are readable.
2. Search all `*.md` content files, **excluding** `.claude/`, `.obsidian/`, and
   `Templates/`.
3. Group the results **by folder** (`Daily Notes/`, `Senso/`, `Themes/`,
   `People/`, `Projects/`, `Archives/`, vault root), and within each show
   `path:line` matches the user can click, with the matching line.
4. End with a count: *N matches across M files.* If there are many hits,
   summarise per folder and show the most relevant lines; offer to expand.
5. **Related notes:** if matched files contain `[[wiki-links]]`, mention a few as
   threads to follow — *"Related: [[Theme A]], [[Sam]]."*

## No results

If nothing matches:
1. Suggest a couple of alternative terms (synonyms / related words).
2. Offer a case-insensitive retry if the original was case-sensitive.
3. Suggest including `Archives/` if it was excluded.

## Notes

- Read-only. Never modify files from `/search`.
- If the query looks like a person or theme, point to the matching `People/` or
  `Themes/` note if one exists.
