# Final Answers

## 1. `git pull` versus `git fetch`

`git fetch` downloads objects and updates remote-tracking references without changing the current branch. `git pull` fetches and then integrates the selected remote branch into the current branch, commonly by fast-forward or merge.

## 2. `git merge` versus `git rebase`

Merge joins branch histories and may create a merge commit while preserving existing commit IDs. Rebase replays commits onto a new base, usually creating new commit IDs and a more linear history.

## 3. When to use `git revert` instead of `git reset`

Use `git revert` to undo a commit on shared history: it adds a new commit that reverses the change without moving existing shared references. Reset moves a branch pointer and can rewrite the history collaborators already have.

## 4. What happens with `git stash`

Git saves tracked working-tree/index changes in a temporary stash entry and restores the tracked files to the current commit's state. Untracked files are excluded by default; use `git stash -u` to include them. A stash is temporary work storage, not a commit or backup.

## 5. Purpose of `git reflog`

The reflog records recent local movements of references such as `HEAD` and branch tips. It can reveal a commit that became unreachable after reset or rebase so a new branch can be created at that commit, while the object remains available.

## 6. `git cherry-pick` versus `git merge`

Cherry-pick applies selected commit changes to the current branch. Merge integrates the histories of branches and all commits not already reachable from the target. Cherry-pick is useful for a focused fix when the rest of a source branch should not be included.

## 7. What `HEAD` means

`HEAD` identifies the current checkout. Usually it symbolically refers to the current branch, whose tip is checked out; in detached-HEAD state it refers directly to a commit.

## 8. What a detached `HEAD` is

A detached `HEAD` means the checkout points directly at a commit rather than a branch name. New commits are not automatically attached to a branch; create a branch if those commits should be retained as named work.

## 9. Why avoid force-pushing a shared branch

Force-pushing can replace commits that collaborators already based work on, making their local histories diverge and potentially obscuring others' work. Prefer new commits and normal pushes on shared branches.

## 10. Is a deleted secret still in Git history?

Yes. Deleting a file in a later commit does not remove the secret from earlier commits. Treat it as compromised, rotate or revoke it immediately, and coordinate appropriate history cleanup; also consider clones, caches, logs, and artifacts. Never include the secret value in an issue, commit, or report.
