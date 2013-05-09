# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="gianu"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=$HOME/bin:$PATH # Include ~/bin/ in PATH

# rvm
rvm_env="$HOME/.rvm/scripts/rvm"
[[ -s $rvm_env ]] && source $rvm_env

alias rake='noglob rake'

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'

# text editors
alias md='open -a Mou'
alias m='mate'

# git alias
alias g='git'
alias gca='git add -A; git commit -a -m "`curl -s http://whatthecommit.com/index.txt`"'

# shortcuts - markdown
alias today='~/bin/today'
alias tomorrow='~/bin/tomorrow'
alias touchdown='~/bin/touchdown'

# directories
alias cating='cd ~/dropbox/ncar/catalog/catalog-ingest/'
alias cnagios='cd ~/dropbox/ncar/catalog/catalog-nagios/'
alias cmodels='cd ~/dropbox/ncar/catalog/catalog_models/'
alias catui='cd ~/dropbox/ncar/catalog/catalog_ui'
alias cmaps='cd ~/dropbox/ncar/catalog/catalog-maps'
alias dnotes='cd ~/dropbox/notes'

# development
alias ctmd='ssh devinb@ctm-dev'
alias sfed='ssh devinb@sferic-dev'
alias jird='ssh devinb@jiradev'

# operations
alias sferic='ssh devinb@sferic -p 23'
alias doppler='ssh devinb@doppler -p 23'
