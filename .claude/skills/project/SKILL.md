---
name: project
description: Create, show the status of, or archive a project. Each project is Projects/<Name>/<Name>.md (PascalCase folder + matching file) with a Supports: field linking to a Senso element. Archiving moves the folder to Archives/Projects/<Name>/. Use for "new project", "project status", "archive this project", "project dashboard", "create a project".
allowed-tools: Read, Write, Edit, Glob, Bash
user-invocable: true
---

# /project

Manage projects. See `project-management.md` for the conventions. Three modes —
infer which one the user wants, or ask.

## create

1. Ask for the project name; convert it to **PascalCase** for the folder.
2. Create `Projects/<Name>/<Name>.md` (file named after the folder) from
   `Templates/Project Template.md`.
3. Fill `created:` with today and `{{name}}` with the readable name.
4. Set the `Supports:` field to a **Senso** element the user names — a wiki-link
   to `[[Direzione]]`, `[[Pratiche]]`, or a month intention `[[Month YYYY-MM]]`.
   Never invent an OKR-style parent layer. If the user isn't sure, leave it
   blank rather than guessing.

## status

1. Read the relevant project file(s) — `Projects/<Name>/<Name>.md` (one project,
   or all active ones).
2. Give a plain-prose dashboard: current state, next actions, open questions,
   what's moved recently. No scoring, no health metrics, no "stalled" flags —
   just where it stands.
3. One piece of neutral hygiene is worth noting: if a project has **no
   `Supports:` link** to a Senso element, mention it once — it may be drifting
   from the compass, or it may just be a standalone project. Surface it; don't
   prescribe.

## archive

1. Move the **entire** folder `Projects/<Name>/` to `Archives/Projects/<Name>/`
   (e.g. `git mv` if tracked, otherwise a plain move). Nothing is deleted.
2. Set `status: archived` in the moved file's frontmatter.
3. Confirm the move.
