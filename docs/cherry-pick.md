# Cherry-Pick

## What it does

`git cherry-pick <commit>` applies the change introduced by a selected commit to the currently checked-out branch and records the result as a new commit when its parent or metadata differs. It is useful for carrying a focused bug fix to a release or maintenance branch without merging every change from the source branch.

## How it differs from merge and rebase

- Merge integrates the histories of branches, usually recording a merge commit when they have diverged. It brings in all commits reachable from the merged branch that are not already present.
- Rebase replays a sequence of commits onto a new base, changing their commit IDs and moving the branch history.
- Cherry-pick selects specific commit changes. It does not merge the source branch's full history or move the source branch.

## Demonstration in this repository

The documentation bug was fixed on `feature/important-fix` in commit `5f8efb0` (`fix: document failed payment status`): README listed `SUCCESS` and `PENDING` while the payment fixture also used `FAILED`. The fix was verified against `src/payments.txt`.

The target branch `feature/cherry-pick-target` was created from the same `main` commit as the source branch, then the actual command `git cherry-pick 5f8efb0` was run. The target contains the correction. Git assigned it the same ID, `5f8efb0`, because it had the same parent and reproduced the same commit content and metadata. If the target branch had an intervening commit, the cherry-picked commit would have a different ID. The two branch names therefore point at the same fix commit in this particular demonstration.
