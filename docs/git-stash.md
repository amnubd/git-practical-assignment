# Git Stash

## What problem it solves

`git stash` temporarily shelves tracked working-tree and staged changes so the working directory can be cleaned for another task without creating a permanent commit. By default, untracked files are not included; use an option such as `-u` when they must be stashed too.

## Stash versus commit

A commit records a named snapshot in the branch's project history. A stash is a temporary stack entry outside the normal branch history, useful for work that is not ready to commit. A stash can later be applied or removed, and should not be treated as a durable backup.

## Restore commands

- `git stash pop` applies the latest stash and removes that entry if application succeeds. It can cause conflicts if the current files changed.
- `git stash apply` applies a stash but keeps the entry on the stash list, allowing another application or later cleanup.
- Both commands can name a specific entry, for example `git stash apply stash@{1}`.

## Demonstration in this repository

On `feature/notification`, a notification scope line was added to `src/app.txt` and left uncommitted. `git stash` saved it; `git status` showed a clean branch and `git stash list` showed the new entry. The work was switched away from and back to the feature branch, then `git stash pop` restored the line and removed the stash entry. `git diff --check` passed after restoration.
