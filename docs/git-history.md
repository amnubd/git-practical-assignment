# Git History Investigation

The commands below were run against this repository after merging the user-management and payment-module pull requests. The relevant graph included:

```text
*   2f64da1 (HEAD -> main, origin/main, origin/HEAD) Merge pull request #2 from amnubd/feature/payment-module
|\
| * f49ff5b (origin/feature/payment-module, feature/payment-module) test: add failed payment example
| * fd07d01 docs: describe payment module
| * 75609ae feat: add sample payment records
* |   a35d608 Merge pull request #1 from amnubd/feature/user-management
|\
| * e6ea150 (origin/feature/user-management, feature/user-management) test: add additional user records
| * 4092168 docs: document user management
| * 870b28c feat: add initial user records
|/
*   728a459 Merge remote-tracking branch 'origin/main'
|\
| * 9e45495 Initial commit
* 21f5ff3 chore: initialize project structure
```

This graph was produced with `git log --oneline --graph --decorate --all`. Branch names and hashes are a snapshot and will change as work continues.

This guide is a reference for interpreting the repository's commit history.

## Options and references

- `--oneline` abbreviates each commit to one line, showing a short commit ID and subject.
- `--graph` draws an ASCII graph of parent/child relationships, including divergence and merges.
- `--decorate` displays references such as branch names, tags, and `HEAD` next to commits.
- `git log` normally shows commits reachable from the current `HEAD`. `git log --all` includes commits reachable from all local references, including other local branches and remote-tracking branches. `--all` does not fetch new commits; run `git fetch` first to update remote-tracking references.
- `HEAD` identifies the current checkout. Usually it points symbolically to the current branch, whose tip is the commit currently checked out. In detached-HEAD state it points directly to a commit instead.
- A branch is a movable reference (pointer) to a commit. Creating a commit on that branch advances its pointer; other branch pointers do not move automatically.

`git log --stat` adds a per-commit summary of files changed and insertion/deletion counts. `git log --oneline --all` is a compact list across all local references but omits the graph unless `--graph` is also supplied.

## Screenshot

Add an unaltered screenshot of the actual Git graph to `docs/screenshots/git-history.png`. Capture it after running `git log --oneline --graph --decorate --all` in the repository. This document does not claim a screenshot has been captured yet.
