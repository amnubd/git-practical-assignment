# Git Ignore Explanation

- `.env` and `.env.*` are ignored because environment files commonly hold machine-specific configuration and secrets. Ignore rules reduce accidental staging, but do not replace secret management; never commit a credential even if it is later removed.
- `node_modules/` contains installed JavaScript dependencies. It is reproducible from a package manifest and lockfile, can be very large, and varies by platform, so it is generally installed rather than versioned.
- `.DS_Store` is metadata created by macOS Finder to remember folder display settings. It is not project source and differs between machines.
- `*.log` ignores generated diagnostic output that can be noisy, machine-specific, or contain sensitive details.
- `*.tmp` is the additional pattern in this project's ignore file. Temporary scratch files are generated during editing or tools and generally do not belong in source history.

Git does not stop tracking a file that was already committed just because a matching ignore rule is added later. Remove an already tracked file from the index separately, and rotate any secret that was exposed in history.