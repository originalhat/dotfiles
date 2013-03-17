# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

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

# mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysql-start='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysql-stop='sudo /usr/local/mysql/support-files/mysql.server stop'

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'

# text editors
alias md='open -a Mou'
alias m='mate'

# git alias
alias g='git'

# shortcuts - markdown
alias today='~/.bin/today'
alias tomorrow='~/.bin/tomorrow'
alias touchdown='~/.bin/touchdown'

# directories
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
alias lito='ssh devinb@lightning'
alias sfeo='ssh devinb@sferic -p 23'
alias jiro='ssh devinb@jira -p 23' # no access
