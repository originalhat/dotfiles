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

# zsh magic
source $ZSH/oh-my-zsh.sh

# direnv
eval "$(direnv hook zsh)"

alias gsd='cd ~/workspace'

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

eval "$(fasd --init auto)"

# export PATH="/usr/local/sbin:$PATH"

# Docker
# alias dkps="docker ps --format 'table {{.Names}}\t{{.ID}}\t{{.Status}}'"
# alias dkdn="docker stop $(docker ps -aq) && docker rm $(docker ps -aq)"

# Docker Compose
alias dc="docker-compose"

# Don't share history immediately
unsetopt inc_append_history
unsetopt share_history


