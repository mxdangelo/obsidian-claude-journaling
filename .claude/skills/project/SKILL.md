---
name: project
description: Create, track, or archive projects. Each project lives in Projects/<Name>/CLAUDE.md.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
user-invocable: true
---

# Project

Project lifecycle: create, status dashboard, archive.

## Subcommands

### `/project new` (default if no arg)

1. Ask the user: project name (PascalCase), one-line description, optional `Supports:` linking to Senso (Direzione / Pratiche / Monthly).
2. **Read** `Templates/Project Template.md`.
3. Substitute placeholders and **Write** `Projects/<Name>/CLAUDE.md`.
4. Confirm with the path.

### `/project status`

1. **Glob** `Projects/*/CLAUDE.md`.
2. **Read** each file, extract: name, status (active/paused/done), progress, next action, last update date.
3. Output a dashboard:

```
| Project | Status | Next Action | Last Update |
|---------|--------|-------------|-------------|
```

4. Flag stalled projects (>14 days without update) and orphans (no `Supports:` link).

### `/project archive <Name>`

1. Verify `Projects/<Name>/` exists.
2. Ask the user for confirmation.
3. Set `status: archived` in the CLAUDE.md frontmatter.
4. Move `Projects/<Name>/` → `Archives/Projects/<Name>/` (create the destination if missing).

## Notes

- Don't call `TaskCreate`.
- PascalCase for folder names.
- A project's `Supports:` field can link any element of `Senso/`.
