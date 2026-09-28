# Remote Repository Investigation

The repository remote was inspected with `git remote -v`; `origin` points to `https://github.com/amnubd/git-practical-assignment.git` for fetch and push. `git branch -a` lists local branches plus remote-tracking branches. `git fetch origin` updates the remote-tracking references without integrating changes into the current local branch. `git status` reports the current branch, its upstream relationship, and working-tree/index changes.

## Fetch and pull

`git fetch` downloads remote commits and updates remote-tracking references such as `origin/main`; it does not change the checked-out branch or working tree. `git pull` fetches and then integrates the fetched branch into the current branch, usually by fast-forward or merge (and it can be configured to rebase).

## `origin/main` and `main`

`origin/main` is the local remote-tracking reference recording the last fetched position of the remote's `main`. `main` is the local branch and moves when local commits are made or integrated. They can point to different commits when local work has not been pushed or remote work has not yet been fetched. Fetch to refresh `origin/main`; pull or another integration command to update local `main`.

## Commands used

```text
git remote -v
git branch -a
git fetch origin
git status
```

The repository's actual remote URL is public; no credentials or tokens belong in this document.
