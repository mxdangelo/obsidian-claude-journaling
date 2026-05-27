---
name: review
description: Smart router. Detects the time/day and routes to /daily, /weekly, or /monthly.
allowed-tools: Bash, Read, Glob
user-invocable: true
---

# Review

Lightweight router. Doesn't do reviews itself — it delegates.

## Detection logic

1. **Explicit arg** (`/review daily|weekly|monthly`): skip detection, route directly.
2. **Last 3 or first day of the month**: suggest `/monthly`.
3. **Sunday or Monday**: suggest `/weekly`. Before suggesting, peek at `Themes/Weave-Log.md` `next_weave` and mention if `/weave` will be triggered.
4. **Other day**: route to `/daily`.

## Steps

1. Run `date +%H %u %d` to get hour, day-of-week (1=Mon..7=Sun), day-of-month.
2. If Sunday/Monday, **Read** `Themes/Weave-Log.md` frontmatter for `next_weave`.
3. Apply the logic above and tell the user: *"Detected: <type>. Proceed?"*
4. On the user's yes, invoke the target skill.

## Notes

- This skill is pure routing — it doesn't read dailies/reviews. The delegated skill does.
- The detection is a suggestion, not a constraint. The user can override.
