# Project management

Projects are the one place this vault tracks structured, goal-shaped work — and
even here it stays light.

## Shape

- One folder per active project: `Projects/<Name>/`, `<Name>` in **PascalCase**.
- The project file is named after its folder: `Projects/<Name>/<Name>.md`
  (e.g. `Projects/Lighthouse/Lighthouse.md`). This keeps every project legible
  in Obsidian's file explorer, quick-switcher, and graph. Built from
  `Templates/Project Template.md`.
- Supporting files (notes, drafts, assets) can live alongside it in the same
  folder.

## The `Supports:` field

Every project's frontmatter has a `Supports:` field linking it to a **Senso**
element: `[[Direzione]]`, `[[Pratiche]]`, or a month intention `[[Month
YYYY-MM]]`. This is how a project connects to the compass.

Never invent an OKR-style parent layer. A project either serves your Direzione,
a practice you're cultivating, or a month's intention — or it's just a project,
and that's fine too.

## Lifecycle (`/project`)

- **create** — scaffold `Projects/<Name>/<Name>.md` from the template.
- **status** — read the project file(s) and give a plain-prose dashboard of
  where things stand.
- **archive** — move the whole folder to `Archives/Projects/<Name>/`. Nothing is
  deleted; closed work is kept, just out of the active set.

## Tone

A project file is a working surface, not a report. Keep `Current state` and the
`Log` honest and in prose. There's no status to perform for anyone.

## Project vs theme

A simple test for where something belongs: **a project you build; a theme you
watch recur.** A project has an active front — deliverables, next actions, a log
you push forward. A theme (in `Themes/`) is a pattern you notice across the
dailies and that `/weave` surfaces — you don't "work" it, you observe it. If
you're acting on it, it's a project; if you're noticing it, it's a theme.
