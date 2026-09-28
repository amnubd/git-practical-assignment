# Reflog Recovery

## What the reflog records

`git reflog` records recent movements of local references such as `HEAD` and branch tips. Entries commonly include checkouts, commits, resets, rebases, and other operations that move a reference. Reflogs are local to a clone and are not pushed as part of the repository.

## Why it can recover a commit

A reset can move a branch pointer so a commit is no longer reachable through the usual branch history. The reflog may still record the earlier `HEAD` value. While the commit object has not been pruned, its SHA can be used to inspect it or create a new branch at it.

A reflog is not a permanent backup: entries expire, unreachable objects can eventually be pruned, and another clone does not automatically contain the local reflog. Push important work or make a durable reference instead of relying on reflog retention.

## Demonstration in this repository

On `experiment/reflog-recovery`, a temporary marker commit was created as `00ac848` (`chore: create reflog recovery marker`). The branch was moved back with `git reset --soft HEAD~1`, so the commit left the normal branch tip and its file remained staged. `git reflog -5` showed the commit at `HEAD@{1}`. The commit was recovered with:

```bash
git branch recovery-branch 00ac848dc8bab749421d3117e1f94b91dd1a8b9b
git switch recovery-branch
```

The recovered branch pointed to `00ac848` and `recovery-marker.txt` was present. The recovery branch retains the marker as evidence of the exercise.
