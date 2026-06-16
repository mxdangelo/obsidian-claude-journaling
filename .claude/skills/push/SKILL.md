---
name: push
description: Commit and push the vault. Generates a commit message from the diff, commits on branch main, rebases on the remote before pushing, checks that an origin remote exists, and never invents a remote. Use for "push", "commit and push", "save my changes to git", "sync to github".
allowed-tools: Bash, Read
user-invocable: true
---

# /push

Commit and push the vault, syncing safely with the remote. The public release
lives on branch **`main`**.

## Usage

```
/push                  # auto-generated message from the diff
/push "custom message" # use the given message
```

## Steps

1. Confirm this is a git repo (`git rev-parse --is-inside-work-tree`). If not,
   say so and stop — don't `git init` unless the user asks.
2. `git status --porcelain` and `git diff`. If there's nothing to commit, skip to
   the sync step (there may still be local commits to push).
3. **Commit message:** use the one provided, or **generate it from the diff** — a
   short, accurate summary of what actually changed (e.g. "Add weave entry and
   update People/Sam"). One subject line, optionally a brief body. Don't pad it.
4. `git add -A` and commit with that message, ending with the standard co-author
   trailer.
5. **Check `origin` exists** before any network step: `git remote get-url
   origin`. If there is no `origin`, stop here — commit only — and tell the user
   there's no remote to push to. **Never invent or add a remote.**
6. **Rebase on the remote, then push.** Pull first so a push is never rejected
   for being behind:
   ```bash
   git pull --rebase origin main
   git push origin main      # use -u on the first push if upstream isn't set
   ```

## Conflicts

1. If the rebase stops on a conflict, surface the conflicting files. For notes,
   trivial conflicts (e.g. both sides appended to a daily) usually resolve by
   keeping both sides; do that and continue.
2. If resolution isn't obvious, walk the user through it rather than guessing.
3. Never `--force` or `--no-verify` unless the user explicitly asks.

## Troubleshooting

- **Push rejected (behind)** → `git pull --rebase origin main`, then push again.
- **No `origin`** → tell the user; never invent a URL.
- **Large binaries** (images, attachments) → suggest Git LFS rather than bloating
  history.

## Notes

This is separate from the once-per-session commit in `session-init.sh`. `/push`
is the explicit "commit my work and sync now" action.
