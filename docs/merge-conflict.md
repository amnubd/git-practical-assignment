# Merge Conflict Exercise

## Why the conflict happened

`feature/profile-update` and `main` both started from the same commit and independently changed the same final paragraph in `README.md`. The feature branch clarified that profile details are sample data; `main` clarified that records are instructional examples. Git could not choose one replacement automatically without losing one side's intent.

## Conflicted file and identification

The only conflicted file was `README.md`. Git reported `CONFLICT (content)` when merging `feature/profile-update` into `main`. `git status` showed the file as unmerged (`UU README.md`), and `git diff` displayed the competing versions.

## Marker meanings

- `<<<<<<< HEAD` starts the version from the current branch (`main`).
- `=======` separates the current-branch version from the incoming version.
- `>>>>>>> feature/profile-update` ends the incoming branch's version.

The marker labels identify the two sides; the marker lines themselves are not content to keep in the final file.

## Resolution

The README was edited to combine both ideas: all records, including profile details, are instructional sample data only. This preserves the useful clarification from each branch rather than discarding either side. The conflict markers were removed, the result was checked with `git diff --check`, and the merge was completed by staging `README.md` and the explanation, then creating a merge commit.

The actual merge was performed locally with `git merge feature/profile-update`. The conflict was not simulated in documentation; it was produced by Git from the two separately committed branch changes.

## Screenshot evidence

Capture screenshots of the actual conflict markers and the resolved README, then save them under `docs/screenshots/`. No screenshot is claimed as included until the files exist.
