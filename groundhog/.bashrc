# rvm
rvm_env="$HOME/.rvm/scripts/rvm"
[[ -s $rvm_env ]] && source $rvm_env

# add custom prompt
PS1="groundhog $ "

# Directory colors.
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced

# directories
alias l='ls -FlG && pwd'
alias ll='ls -aFlG && pwd'
alias ..='cd ..'

# text editors
alias md='open -a Mou'
alias m='mate'
alias s='sl'
alias v='vi'

# shortcuts
alias mysql='/usr/local/mysql/bin/mysql'
alias g='git'

# shortcuts - markdown
alias today='~/.bin/today'
alias tomorrow='~/.bin/tomorrow'
alias touchdown='~/.bin/touchdown'

# directories
alias cnagios='cd ~/dropbox/ncar/catalog-nagios/'
alias cmodels='cd ~/dropbox/ncar/catalog_models/'
alias cuinter='cd ~/dropbox/ncar/catalog_ui'
alias dnotes='cd ~/dropbox/notes'

# development
alias ctmd='ssh devinb@ctm-dev'
alias sfed='ssh devinb@sferic-dev'
alias jird='ssh devinb@jiradev'

# operations
alias lito='ssh devinb@lightning'
alias sfeo='ssh devinb@sferic -p 23'
alias jiro='ssh devinb@jira -p 23' # no access

# git autocompletion
source ~/.bin/.git-completion
