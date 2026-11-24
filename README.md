# originalhat/dotfiles

Dotfiles and machine setup for my Mac. This repo is the source of truth: if a setting matters, it lives here.

## Setup

```sh
git clone https://github.com/originalhat/dotfiles ~/workspace/dotfiles
~/workspace/dotfiles/bin/setup
```

`bin/setup` is safe to run any time. It:

1. Symlinks everything listed in [`links`](links) into `$HOME`, backing up any existing file to `*.pre-dotfiles`
2. Installs the [`Brewfile`](Brewfile) and the tools in [`mise/config.toml`](mise/config.toml)
3. Enables Touch ID for `sudo`
4. Turns on this repo's pre-commit hook (gitleaks, shellcheck, tests)

`bin/setup --check` reports drift without changing anything.

## Working on this repo

```sh
mise run test   # bats tests
mise run lint   # shellcheck
```

Decisions and their reasoning live in [`docs/adr`](docs/adr).

## vim

```
./vim/set-helptags.sh
```

## monitor calibration

1. close/disconnect all other screens
2. run script
3. disable [SIP](https://stackoverflow.com/a/32910408):
4. `sudo mount -uw / && killall Finder` (catalina)
5. move generated files to `/System/Library/Displays/Contents/Resources/Overrides/`
6. disconnect/reconnect (or restart) to take effect
7. re-enable SIP!

Additional references:

- http://www.ispcolohost.com/2013/07/11/connecting-a-dell-ultrasharp-u3014-to-a-mac-ugh/
- https://embdev.net/topic/284710#3027030
