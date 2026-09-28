# Hotfix Process

## Scenario and scope

For this learning repository, `v1.0.0` represents the released state and `v1.0.1` the hotfix release. The simulated issue was a mismatch in the payment data contract: `src/payments.txt` contains a `FAILED` status, but the released README listed only `SUCCESS` and `PENDING`. This text-only project has no production payment service, so the exercise demonstrates the release workflow and fix selection rather than repairing a live payment processor.

## Investigation and fix selection

The issue was found by comparing `README.md` with the sample records in `src/payments.txt`. The focused fix already existed as commit `5f8efb0` on `feature/important-fix`. Rather than reimplementing it or merging unrelated branch history, `hotfix/v1.0.1` was created from the `v1.0.0` tag and the fix was applied with:

```bash
git switch -c hotfix/v1.0.1 v1.0.0
git cherry-pick 5f8efb0
```

The resulting hotfix commit was `648b5c6` (`fix: document failed payment status`).

## Verification and review

The hotfix was checked to ensure the README lists `SUCCESS`, `PENDING`, and `FAILED`, and that `PAY003,USR003,250,INR,FAILED` exists in the fixture. `git diff --check` passed. The change was proposed in [PR #3](https://github.com/amnubd/git-practical-assignment/pull/3), targeting `main`, and merged with a regular merge commit (`4eda4d9`).

## Release

After pulling the merged PR, an annotated `v1.0.1` tag was created on `main` and pushed. A GitHub Release for `v1.0.1` was published with the hotfix and verification notes. The original annotated `v1.0.0` tag and GitHub Release remain as the before-fix release point.

## Team workflow considerations

A hotfix should be based on the release that is actually deployed, not blindly on the newest `main`. Select the smallest verified fix, test it against the release branch, review it through a pull request, and release a new patch version. Unfinished feature work remains on its own branch and should not be pulled into the hotfix unless it is required for the fix.
