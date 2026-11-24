# 2. Treat agents as the threat model

Date: 2026-11-24

## Context

Coding agents run on this machine all day with broad access. So do dependencies, installers and cloned repos. Anything that runs as me can read any secret I leave on disk.

## Decision

- No secrets in plaintext config. Keep them in 1Password or the macOS Keychain and inject them when needed. Docker uses the `osxkeychain` credential helper.
- Keep secrets out of shell history (`zsh/history-filter.zsh`).
- Wait 3 days before installing new package releases where the tool supports it: mise, npm and uv. Most malicious releases are caught and pulled within that window. npm also skips install scripts by default.
- This repo has a pre-commit hook that runs gitleaks, because tracked configs like `~/.npmrc` are places tools like to write tokens.
- Human approval (Touch ID or password) gates `sudo`.

## Consequences

- Some npm installs need `npm rebuild <pkg>` or `--ignore-scripts=false`.
- A package published in the last 3 days can't be installed without an explicit override.
- Yarn 4.0 and pnpm 9 are too old for their cooldown settings. Add them once the projects that use them upgrade.
