# 3. mise owns language runtimes and dev tools

Date: 2026-11-24

## Decision

mise installs Ruby and Node (replacing rbenv, nvm and Homebrew `node`) and reads each project's `.ruby-version` and `.nvmrc`. Global versions are pinned in `mise/config.toml`. Yarn comes from corepack, which follows each project's `packageManager` field.

Homebrew keeps casks, services (Postgres, Redis, Colima), system libraries, and CLIs that are already installed there. Don't move a tool from Homebrew to mise just to move it; do it when there's a reason such as pinning or a project needing a specific version.

Non-interactive shells (agent tool calls) get mise through shims in `.zshenv`, so they resolve the same versions as an interactive terminal.
