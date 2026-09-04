# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(gitifast)

# DISABLE AUTOCORRECT
unsetopt correct_all

# Word movement with Option+Arrow
bindkey "\e[1;3D" backward-word
bindkey "\e[1;3C" forward-word
bindkey "\eb" backward-word
bindkey "\ef" forward-word

# zsh magic
source $ZSH/oh-my-zsh.sh

# direnv
eval "$(direnv hook zsh)"

# tmux
alias ta='tmux attach -t'
alias tl='tmux ls'
alias td='tmux detach'

export EDITOR="nvim"
export VISUAL="nvim"

alias gsd='cd ~/workspace'
alias obs='cd "/Users/devin/Library/Mobile Documents/iCloud~md~obsidian/Documents/Sepulcher"'

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'

# git alias
alias gap='git add -p'
alias gca='git commit -a -m "`curl -s http://whatthecommit.com/index.txt`"'
alias gst='git status'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# export PATH="/usr/local/opt/openssl/bin:$PATH"

# eval "$(fasd --init auto)"

# export PATH="/usr/local/sbin:$PATH"

# Docker
# alias dkps="docker ps --format 'table {{.Names}}\t{{.ID}}\t{{.Status}}'"
# alias dkdn="docker stop $(docker ps -aq) && docker rm $(docker ps -aq)"

# Docker Compose
alias dc="docker-compose"

# Don't share history immediately
unsetopt inc_append_history
unsetopt share_history

# preserve IEX history
export ERL_AFLAGS="-kernel shell_history enabled"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/opt/homebrew/bin:$PATH"

export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

# export PATH=$(pyenv root)/shims:$PATH/

# source /Users/devin/.docker/init-zsh.sh || true # Added by Docker Desktop

alias yarnf='pushd client >/dev/null && yarn "$@" && popd >/dev/null'

export PATH="$HOME/.local/bin:$PATH"
eval "$(~/.local/bin/mise activate zsh)"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$PATH:$HOME/.maestro/bin

# bb's CLI binary only lands on PATH inside bb-managed terminals; add it here
# so `bb` also works from a regular terminal.
BB_APP_CLI_DIR="/Applications/bb.app/Contents/Resources/app.asar.unpacked/node_modules/bb-app/host-daemon/dist"
[[ -d "$BB_APP_CLI_DIR" ]] && export PATH="$PATH:$BB_APP_CLI_DIR"

# `bb .` (or `bb <path>`) registers the current dir/repo as a bb project
# (creating it if needed) instead of erroring out on an unknown command.
bb() {
  if [[ $# -eq 1 && ( "$1" == "." || -d "$1" ) ]]; then
    local target_path
    target_path="$(cd "$1" && pwd)"

    local existing_id
    existing_id="$(command bb project list --json 2>/dev/null | \
      jq -r --arg p "$target_path" \
      '.[] | select(.sources[]?.path == $p) | .id' | head -n1)"

    if [[ -n "$existing_id" ]]; then
      echo "bb project already exists for $target_path: $existing_id"
      command bb project show "$existing_id"
    else
      local name
      name="$(basename "$target_path")"
      echo "Creating bb project \"$name\" for $target_path"
      command bb project create --name "$name" --root "$target_path"
    fi
    return
  fi

  command bb "$@"
}
