# Reset Versus Revert

| Command | Purpose | Rewrites history? |
| --- | --- | --- |
| `git revert <commit>` | Create a new commit that reverses the selected commit's changes. | No; it adds a commit and preserves the existing commits. |
| `git reset --soft <commit>` | Move the current branch pointer to the selected commit; keep later changes staged in the index. | Yes; commits after the target are no longer on that branch. |
| `git reset --mixed <commit>` | Move the branch pointer and reset the index; keep later changes in the working tree unstaged. This is the default reset mode. | Yes; commits after the target are no longer on that branch. |
| `git reset --hard <commit>` | Move the branch pointer, reset the index, and replace tracked working-tree contents with the target tree. Uncommitted tracked changes can be lost. | Yes, and it can discard work. Do not run casually. |

Reset only moves references and/or the index and working tree; a commit made unreachable by reset may remain recoverable for a time through the reflog, but this is not a backup strategy.

## Demonstration in this repository

On `experiment/reset-revert`, a deliberately incorrect sentence was committed as `96fa47c` (`fix: add incorrect branch explanation`). `git revert 96fa47c` created `775b36d` (`Revert "fix: add incorrect branch explanation"`), which removed the sentence while leaving both commits visible in history.

On the separate `experiment/reset-soft-mixed` branch, commit `2754b53` was undone with `git reset --soft HEAD~1`; `reset-demo.txt` remained staged while the branch pointer returned to `4dc00bc`. A temporary commit `ab91df8` was then undone with `git reset --mixed HEAD~1`; the branch pointer returned to `fa56b28`, while its file change remained unstaged. No `reset --hard` command was run.

## Security scenario: a committed password on a private, unshared branch

Treat the password as compromised and rotate/revoke it immediately; removing the file later does not remove the secret from earlier commits. If nobody else has fetched the branch and the secret must be purged from reachable history, coordinate a history rewrite on that private branch and update the remote carefully. Also consider cached clones, logs, artifacts, and repository backups. Never rely on rewriting history instead of rotating the credential.

## Bad change already pulled from `main`

Prefer `git revert <bad-commit>` because it publishes a new corrective commit without changing the shared history that other developers already have. Avoid resetting and force-pushing shared `main`; that would make collaborators' local histories diverge.
