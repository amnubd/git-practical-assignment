# Git Bisect

## What it does

`git bisect` searches a commit range to find the first commit where a test changes from good to bad. It uses binary search, so a range of many commits can usually be narrowed with far fewer tests than checking every commit linearly.

## Demonstration in this repository

A six-commit history was built on `experiment/bisect-demo`:

| Point | Commit | Expected result |
| --- | --- | --- |
| A | `ee576aa` | Good: baseline marker is `GOOD`. |
| B | `4034f47` | Good: checker was made to fail closed on read errors. |
| C | `a8b2810` | Good: status remains `GOOD`. |
| D | `041333d` | Bad: marker changes to `BUG`. |
| E | `b51fa60` | Bad: later note retains `BUG`. |
| F | `e8b799e` | Bad: latest note still retains `BUG`. |

The test script `scripts/check-bisect.ps1` returns 0 for `GOOD`, 1 for `BUG`, and 125 for an unrecognized state. The sequence used was:

```bash
git bisect start
git bisect bad e8b799e
git bisect good a8b2810
git bisect run powershell.exe -NoProfile -ExecutionPolicy Bypass -File scripts/check-bisect.ps1
```

Git tested E and then D, identifying `041333d8d48c90859079812bb55478b817c32957` (`fix: introduce bisect regression`) as the first bad commit. The session was ended with `git bisect reset`.

## Result

The deliberate regression was introduced at D when `src/bisect-demo.txt` changed from `GOOD` to `BUG`. Binary search made it unnecessary to test all six commits individually.
