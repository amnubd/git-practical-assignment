# Interactive Rebase

## Purpose

Interactive rebase edits a sequence of commits before replaying it. Common todo actions include `pick`, `reword`, `edit`, `squash`, and `fixup`.

`squash` combines a commit with the preceding commit and lets you edit the combined message. `fixup` also combines changes with the preceding commit but discards the fixup commit's message.

## Squashing commits

Run `git rebase -i HEAD~N` to edit the last `N` commits. The todo list appears oldest first. Keep the first commit in a group as `pick`, then mark a later commit `squash` or `fixup` to fold it into its predecessor.

Review the resulting diff and history before publishing. Interactive rebase changes commit IDs, so use it on private work; coordinate before rewriting commits others may already have fetched.

## Demonstration in this repository

Four incremental commits were created on `feature/interactive-rebase`: `abaab2c`, `0deefc7`, `03d29be`, and `8d77249`. The two `fixup!` commits were autosquashed with `git rebase -i --autosquash HEAD~4`, leaving two commits: `d76df40` (`docs: add interactive rebase outline`) and `c4f4274` (`docs: explain interactive squash choices`). The four original commits existed only on this private local branch when rewritten.
