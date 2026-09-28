# Architecture

This learning project uses text files instead of services or a database so Git changes remain small and reviewable.

## Components

- `src/app.txt` records the application's purpose, modules, storage choice, and limitations.
- `src/users.txt` is the sample user data source. Each row follows `User ID,Name,Email,Status`.
- `src/payments.txt` is the sample payment data source. Each row follows `Payment ID,User ID,Amount,Currency,Status`.
- `README.md` introduces the project and its data formats.

Payment rows refer to users by ID. All records added for the assignment should be synthetic and must not contain real personal, account, or payment information.

## Scope

There is no runtime service, persistent database, authentication layer, or external payment integration. Those limitations are intentional: the repository is a fixture for Git practice, not a deployable application.