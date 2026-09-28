# Git Practical Assignment (`git-practical-assignment`)

A small text-based project for practicing Git workflows. The repository models a basic application, user records, and payment records; the files are deliberately plain text so changes are easy to inspect in Git diffs.

## Project layout

- `src/app.txt` describes the application and its current scope.
- `src/users.txt` is the user-record data file.
- `src/payments.txt` is the payment-record data file.
- `docs/architecture.md` summarizes the files and their relationships.

## User management

The user-management module is represented by records in `src/users.txt`. Each row contains a unique user ID, name, email, and status (`ACTIVE` or `INACTIVE`). The records are synthetic examples for Git exercises; they do not implement registration, authentication, or account updates.

## Data format

User records use comma-separated fields documented in `src/users.txt`. Payment records use `Payment ID,User ID,Amount,Currency,Status`; amounts are examples, not production financial data.

## Payment module

The payment module is represented by synthetic rows in `src/payments.txt`. Each row contains a payment ID, related user ID, amount, currency, and status. Example statuses include `SUCCESS`, `PENDING`, and `FAILED`; these records do not initiate or settle real payments.

## Git exercise documentation

Configuration, ignore rules, repository history, conflict resolution, stash, rebase, interactive rebase, cherry-pick, reset/revert, reflog, bisect, remote investigation, final answers, and hotfix notes are recorded under `docs/`. See the relevant guide for actual commit IDs and command results from this repository.

This is a Git learning project, not a production application. It has no database, authentication, payment processor, or automated tests; all records, including profile details, are instructional sample data only.
