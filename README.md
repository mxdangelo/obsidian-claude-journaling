> ⚠️ **This repository is archived and no longer maintained.**
> The system has moved to **[obsidian-claude-pkm](https://github.com/mxdangelo/obsidian-claude-pkm)** — the
> same journaling-first core, now with the full system (projects as a single task source, the
> knowledge-side capture cycle, longitudinal weaving) and a documented *minimal setup* for those
> who want only this lean journaling version. Start there.

---

# A journaling-first PKM for Obsidian + Claude Code

**A compass, not a cascade.**

This is a personal knowledge-management system built around one habit: writing a
daily note. Everything else — patterns, themes, portraits of the people in your
life, a sense of whether you're living the way you said you wanted to — *emerges*
from those dailies by accretion. There are no OKRs, no quarterly cascade, no
forced monthly ritual, no inbox to process. You write; the system reflects.

It runs as an [Obsidian](https://obsidian.md) vault with a set of
[Claude Code](https://claude.com/claude-code) skills layered on top.

---

## The two cores

Almost everything here is a service around two things:

1. **The daily note** — `Daily Notes/YYYY-MM-DD.md`. This is where you write.
   It's fast to open, carries forward unfinished tasks, and asks nothing of you
   beyond showing up. No goal context is loaded; no cascade is computed.

2. **`/weave`** — the longitudinal reader. Run it when you feel like looking
   back. It reads your dailies since the last weave, notices what's recurring,
   what's evolving, what's new, and writes it back to you in the second person —
   quoting your own words. It distills portraits of recurring people and living
   theme notes. It's a **mirror**: it describes and surfaces, it never scores,
   nags, or prescribes. It may leave a thread on an open question. This is your
   reflective space.

Everything below orbits these two.

---

## Design principles

- **Mirror, not tracker.** Skills that reflect (`/weave`, `/senso-tracking`)
  describe what's alive and surface gaps. They never prescribe, score, or nag.
- **No artificial layers.** No OKRs, no forced monthly/quarterly cascade.
- **Lean.** The auto-loaded context stays small. Generated content is prose, not
  bullet dumps.
- **Opt-in over automatic.** Nothing runs on a hidden schedule. You invoke
  things. `/weave` in particular *never* auto-runs.

---

## A note on Italian terms

The system keeps exactly three Italian words as signature terms — treat them the
way you'd treat "Zettelkasten" or "kanban": loan-words for a specific idea,
deliberately untranslated.

- **Senso** — *sense / meaning / direction.* The folder `Senso/` holds your
  personal compass: who you want to be and what you choose to cultivate. It is
  the still point the reflective skills compare your daily life against.
- **Direzione** — *direction / heading.* `Senso/Direzione.md` is a compass
  heading written in a sentence or two: the kind of person you're aiming to be,
  where you want to be. Not a list of objectives.
- **Pratiche** — *practices.* `Senso/Pratiche.md` is what you choose to cultivate
  regularly — practices, not a habit-tracker checklist.

Everything else — every folder name, every skill, every doc — is in English.

---

## Folder structure

```
.
├── .claude/
│   ├── skills/            # one folder per skill, each with SKILL.md
│   ├── agents/            # note-organizer only
│   ├── hooks/             # session-init.sh, skill-discovery.sh
│   └── docs/conventions/  # markdown-standards, productivity-workflow,
│                          #   project-management, task-tracking
├── Daily Notes/           # YYYY-MM-DD.md  (the center of gravity)
├── Senso/                 # Direzione.md, Pratiche.md, Month YYYY-MM.md,
│                          #   Weekly Review YYYY-Wxx.md
├── Projects/              # one folder per active project, each a <Name>.md
├── Themes/                # Weave-Log.md + one file per theme
├── People/                # portraits of recurring people
├── Templates/             # Daily / Month / Project / Weekly Review /
│                          #   Direzione / Pratiche
├── Archives/              # closed material (projects → Archives/Projects/)
├── Agenda.md              # appointments & deadlines (source of truth)
├── CLAUDE.md
├── FIRST_RUN              # first-run sentinel; /init removes it
├── LICENSE                # MIT
└── README.md
```

There is **no `Inbox/`** and **no Goals folder**. You capture in the daily; a
seed of an idea can live in any note, but there is no separate inbox to triage in
this release.

---

## The skills

Invoke any of these in Claude Code by typing its slash command.

| Skill | What it does |
|-------|--------------|
| `/daily` | Create or open today's daily note. Carries forward unchecked tasks from the previous daily; deposits dated *traces* to `People/` as people come up. At end of day, helps fill the closing sections. Fast — no cascade context. |
| `/weekly` | A **planning-focused** weekly review (Sundays). Reads active projects, `Agenda.md`, and open loops from the last review. Asks *you* for the one thing only — a commitment, never inferred. It does **not** re-read the journal and does **not** trigger `/weave`; reflection lives in `/weave`. |
| `/weave` | Longitudinal pattern analysis, launched **manually** (never auto-runs). Reads dailies since the last weave, classifies what it finds as Evolution / Weaving / New, writes a dated entry to `Themes/Weave-Log.md`, and distils portraits in `People/` and theme notes in `Themes/`. Second-person voice, your language, your words quoted back. |
| `/senso-tracking` | A coherence mirror between `Senso/` and what you actually write. Surfaces "alive vs declared" and gaps — never says "do it more." Auto-suggested when you ask things like *"am I following my practices?"* or *"am I aligned with my Direzione?"* |
| `/agenda` | Manages `Agenda.md`: adds appointments from natural phrasing, auto-archives past rows, and populates the "📅 Today" line in the daily. |
| `/project` | Create / status / archive a project. Each project is `Projects/<Name>/<Name>.md` (PascalCase folder + matching file). A `Supports:` field links it to a Senso element. Archiving moves the folder to `Archives/Projects/<Name>/`. |
| `/push` | Commit and push, with a commit message auto-generated from the diff. Rebases on the remote first so a push is never rejected; checks that `origin` exists; never invents a remote. |
| `/check-links` | Scan the vault for broken `[[wiki-links]]`. |
| `/search` | Grep across the vault, grouped by folder, skipping `.claude/`, `.obsidian/`, and `Templates/`. |
| `/init` | First-run bootstrap: walks you through writing Direzione and Pratiche, then removes `FIRST_RUN`. |

**Deliberately absent:** there is no `/monthly` (no monthly ritual), no `/review`
router, and no inbox-processing skill. If you came here looking for them, that's
the design — not an omission.

---

## Hooks

- **`session-init.sh`** (SessionStart) — sets a few date variables, surfaces the
  *one thing only* from your most recent Weekly Review, and prints a neutral
  "last weekly review: N days ago" line (no "overdue" nag). If `FIRST_RUN` exists
  or `Senso/` is empty, it nudges you toward `/init`. It also makes **one** git
  commit of the previous session's changes — commit-once-per-session, which
  replaces per-save auto-committing.
- **`skill-discovery.sh`** (UserPromptSubmit) — lightweight routing that suggests
  the relevant skill for a prompt.

There is intentionally **no auto-commit on every save.** Committing happens once
per session, in `session-init.sh`.

---

## Extras

- **People in two phases.** `/daily` appends dated *traces* to `People/<Name>.md`
  as people come up; `/weave` later distils those traces into a portrait under
  `## Recurring threads`. The daily lays down raw dated material; the weave turns
  it into a living portrait — the two never cross.
- **The `Nudge` output style** (`.claude/output-styles/nudge.md`) — an opt-in
  mode for when you don't want the mirror but a hand that moves things: questions
  that open the next step, anchored to your Senso, deliberately built to push
  *without* nagging. Never the default.
- **`scripts/statusline.sh`** — an optional ambient status line (note count,
  uncommitted changes, whether today's daily exists). Wire it in `settings.json`
  with a `statusLine` block; the script documents how.

---

## The one agent

`note-organizer` (manual invocation only) does vault hygiene: it finds orphan
notes, checks tag consistency against the markdown standards, and suggests
archiving. For broken links it defers to `/check-links` rather than duplicating
the check. There is no `inbox-processor` and no `weekly-reviewer` agent — those
responsibilities live in the daily and in `/weekly` respectively.

---

## Getting started

1. Open this folder as an Obsidian vault, and as a Claude Code project.
2. On first launch, the session hook will notice `FIRST_RUN` and suggest `/init`.
3. Run **`/init`** and write your Direzione and Pratiche in your own words.
4. Run **`/daily`** and start journaling.
5. After a couple of weeks of dailies, run **`/weave`** and read yourself back.

The repository ships with a few **sample notes** (a daily, a weave entry, a
person, a project) using a fictional persona named **Alex**. They exist only to
show the format — delete them before you start. Each one says so at the top.

---

## Credits

This is a clean, neutral, public release derived from and inspired by
**[obsidian-claude-pkm](https://github.com/)** (MIT). The upstream project
provided the original scaffolding of an Obsidian + Claude Code knowledge system;
this release re-imagines it around a journaling-first philosophy. Shared under
the MIT License — see [`LICENSE`](LICENSE).
