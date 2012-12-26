# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

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

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/heroku/bin:/Users/dgb/.rvm/gems/ruby-1.9.3-p327/bin:/Users/dgb/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/dgb/.rvm/rubies/ruby-1.9.3-p327/bin:/Users/dgb/.rvm/bin

export PATH=/Users/Devinb/.rvm/gems/ruby-1.8.7-p357@catalog_ui/bin:/Users/Devinb/.rvm/gems/ruby-1.8.7-p357@global/bin:/Users/Devinb/.rvm/rubies/ruby-1.8.7-p357/bin:/Users/Devinb/.rvm/bin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/local/sbin

# rvm
rvm_env="$HOME/.rvm/scripts/rvm"
[[ -s $rvm_env ]] && source $rvm_env

alias rake='noglob rake'

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'
alias ..='cd ..'

# text editors
alias md='open -a Mou'
alias m='mate'
alias s='/usr/local/bin/sl'
alias v='vi'

# git alias
alias g='git'

# shortcuts - markdown
alias today='~/bin/today'
alias tomorrow='~/bin/tomorrow'
alias touchdown='~/bin/touchdown'

# directories
alias cnagios='cd ~/dropbox/ncar/catalog-nagios/'
alias cmodels='cd ~/dropbox/ncar/catalog_models/'
alias catui='cd ~/dropbox/ncar/catalog_ui'
alias dnotes='cd ~/dropbox/notes'

# development
alias ctmd='ssh devinb@ctm-dev'
alias sfed='ssh devinb@sferic-dev'
alias jird='ssh devinb@jiradev'

# operations
alias lito='ssh devinb@lightning'
alias sfeo='ssh devinb@sferic -p 23'
alias jiro='ssh devinb@jira -p 23' # no access
