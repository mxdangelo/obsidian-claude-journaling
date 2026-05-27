---
name: senso-tracking
description: Coherence mirror. Do Direzione and Pratiche reflect what you actually write and do? Surfaces alive vs declared, gaps, recurring loops.
allowed-tools: Read, Glob, Grep
---

# Senso Tracking

Reads `Senso/Direzione.md`, `Senso/Pratiche.md`, the recent Monthly, and the last 2-3 Weekly Reviews. Surfaces alignment and gaps. **It's not a tracker, it's a mirror.**

## Steps

1. **Read** `Senso/Direzione.md`. Extract main themes (who I want to be, where I want to go).
2. **Read** `Senso/Pratiche.md`. Extract the practices (1-2 word names) and their intended frequency.
3. **Glob** `Senso/Monthly *.md`. **Read** the current month and the previous one.
4. **Glob** `Senso/Weekly Review *.md`. **Read** the last 2-3.
5. **Glob** `Daily Notes/*.md`. **Read** the most recent ~14 dailies.
6. **Analyze**:
   - For each practice in Pratiche: how many times is it mentioned/referenced in the recent dailies/reviews? Implicit frequency vs declared.
   - Themes in Direzione: do they recur in daily writing? Or are they declared but absent?
   - Open loops or recurring themes in Monthly/Weekly Reviews: are they connected to Direzione, or are they "noise"?
7. **Output** a report:

```markdown
## Senso Tracking — <today's date>

### Direzione: alive vs declared
- "<theme 1>": appears in N of the last 14 dailies, in M of the last weekly reviews. **Alive.**
- "<theme 2>": declared but missing. **Gap.**

### Pratiche: cultivated vs intended
| Practice | Intended | Last 14 days | Status |
|----------|----------|--------------|--------|
| ...      | ...      | N times      | Alive / Sparse / Absent |

### Recurring open loops
- "<loop>": present in N reviews/monthly. Not connected to Direzione.

### Note
[1-2 lines of synthesis: where is the system reflecting Senso, where is it drifting?]
```

## Tone

- It's a mirror, not a judgment. Descriptive, not prescriptive.
- If a practice has been "Absent" for 14+ days, don't suggest "do it more" — just surface the gap. Decisions belong to the user.
- Don't call `TaskCreate`.
- Respect the user's writing language.
