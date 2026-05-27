# Obsidian Claude Journaling

> A **journaling-first** PKM system for Obsidian + Claude Code.
> Not an OKR cascade — a compass.

---

## Philosophy

Most AI-powered PKM systems try to recreate a goal cascade: vision → annual → quarterly → monthly → weekly → daily. It works for people who think in OKRs. For many others, it doesn't.

**This system starts from the daily.** Daily writing is the center. From there, other layers emerge by accretion:

- **Senso/** — who you are, where you go, what you cultivate (Direzione, Pratiche)
- **Daily Notes/** — the day, written as prose
- **People/** — your constellation. Profiles of the people who recur in your writing. Linking to `[[People/Name]]` from a daily makes a person legible across time: who you wrote about, when, in what state.
- **Themes/** — longitudinal patterns that emerge, captured by `/weave`
- **Projects/** — only when an initiative becomes concrete enough to deserve its own file

No artificial layers. No forced OKRs. Just what emerges from practice.

### A note on Italian terms

`Senso`, `Direzione`, `Pratiche` are kept as the system's signature concepts — like *Zettelkasten* or *kanban*. Roughly:

- **Senso** — sense, meaning, direction (one word for all three)
- **Direzione** — direction, compass heading
- **Pratiche** — practices, what you regularly cultivate

Everything else (skills, templates, documentation) is in English.

## Prerequisites

- [Obsidian](https://obsidian.md/)
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code)
- Git

## Quick Start

```bash
git clone https://github.com/<your-username>/obsidian-claude-journaling.git MyVault
cd MyVault
```

Open the folder in Obsidian (`Open folder as vault`). From the terminal, start Claude Code at the root:

```bash
claude
```

Try:
- `/daily` — create or open today's note
- `/weekly` — weekly review (Sunday)
- `/weave` — longitudinal pattern analysis (auto-runs during `/weekly`)

## Structure

```
.
├── .claude/             # Skills, agents, hooks, conventions
│   ├── skills/          # /daily, /weekly, /monthly, /weave, /project, ...
│   ├── agents/          # note-organizer, weekly-reviewer, ...
│   ├── hooks/           # session-init, auto-commit, skill-discovery
│   └── docs/conventions/# Markdown standards, task tracking, ...
├── Daily Notes/         # YYYY-MM-DD.md
├── Senso/               # Direzione, Pratiche, Monthly, Weekly Review
├── Projects/            # One folder per active project
├── Themes/              # Weave-Log + one file per theme
├── People/              # Profiles (who you want to track)
├── Templates/           # Daily / Monthly / Project / Weekly Review templates
├── Archives/            # Closed material
└── Inbox/               # Quick capture
```

## Main Skills

| Skill | What it does |
|---|---|
| `/daily` | Creates/opens today's daily, carries forward tasks from yesterday. Fast — no cascade context. |
| `/weekly` | Weekly review. Triggers `/weave` if overdue. |
| `/monthly` | Roll-up of the month, intention for the next. |
| `/weave` | Longitudinal pattern analysis: reads recent dailies, classifies patterns (Evolution / Weaving / New) and updates `Themes/Weave-Log.md`. |
| `/senso-tracking` | Coherence mirror between Direzione/Pratiche and what you actually write & do. Surfaces gaps, not metrics. |
| `/agenda` | Manages Agenda.md (root): adds appointments inline, archives past rows, populates "📅 Today" in the daily. |
| `/project` | Create, track, archive projects. |
| `/push` | Commit & push. |
| `/check-links` | Scan for broken wiki-links. |
| `/search` | Grep across the vault, grouped by folder. |

## Customization

- **Personal compass**: copy `Templates/Direzione Template.md` to `Senso/Direzione.md` and `Templates/Pratiche Template.md` to `Senso/Pratiche.md`, then rewrite in your own voice. The templates contain guiding questions, not OKRs.
- **Language**: skill prompts are in English. To use the system in another language, translate `.claude/skills/*/SKILL.md` files and `Templates/`.
- **Hooks**: see `.claude/settings.json`. Disable by setting `command` to `null`.
- **Permissions**: add personal entries in `.claude/settings.local.json` (gitignored).

## Credits

Forked in spirit from [obsidian-claude-pkm](https://github.com/ballred/obsidian-claude-pkm) (MIT, v3.1). Rewritten to be journaling-first, lean (~1k token auto-load vs. ~7k upstream), focused on Senso/Themes rather than Goals/Cascade.

## License

MIT. See `LICENSE`.
