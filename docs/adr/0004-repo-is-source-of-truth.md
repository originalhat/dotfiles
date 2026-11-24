# 4. The repo is the source of truth

Date: 2026-11-24

## Decision

If a setting matters, it lives in this repo and `bin/setup` puts it in place. The `links` manifest is data (what goes where); `bin/setup` is behavior (how). Add a file by adding a line to `links`, not by editing the script.

`bin/setup` is idempotent and never destroys anything: an existing file gets moved to `*.pre-dotfiles` before it's replaced. `bin/setup --check` reports drift, such as a config that a tool rewrote as a regular file.

The Brewfile is regenerated with `brew bundle dump`, so it reflects what's actually installed.
