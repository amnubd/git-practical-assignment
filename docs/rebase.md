# Rebase

## What rebase does

`git rebase <upstream>` takes commits on the current branch that are not reachable from the upstream and replays them, in order, on top of the upstream tip. This makes the branch appear to have started from the newer base.

## Rebase and merge

A merge joins histories by creating a commit with both histories as parents (unless the merge can fast-forward). It preserves the original commit IDs and makes the branch divergence visible. A rebase replays commits onto a new parent and normally produces a linear history, but the replayed commits have new IDs.

## Why history changes and the shared-branch risk

A commit ID includes its parent ID. When rebase changes a commit's parent, its ID changes, and descendants receive new IDs too. Other people may already have based work on the old commits, so rebasing a shared or public branch can make their histories diverge and require reconciliation. Avoid rewriting commits that others may have fetched; never force-push shared `main`.

## When to choose each

- Prefer merge when preserving the exact shared history matters, when integrating public/shared branches, or when an explicit integration point is useful.
- Prefer rebase for private local feature work when updating it onto a newer base before review, provided the commits have not been shared or collaborators agree to rewrite them.

## Demonstration in this repository

The local branch `feature/rebase-demo` started at `cd34bb0` and received two commits: `90d00c0` and `044ee6a`. While that branch was in progress, `main` advanced with commit `4dc00bc` (`docs: note git workflow architecture`). After fetching, the feature branch was rebased with `git rebase origin/main`.

The rebase succeeded without conflicts. The two commits were replayed as `6b3153c` and `0a33444`, now above `4dc00bc`. Their content and subjects remain, but their IDs changed because their parent history changed. The pre-rebase commits were local and had not been pushed, so no shared branch was rewritten.
