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
