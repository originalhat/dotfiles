# rvm
rvm_env="$HOME/.rvm/scripts/rvm"
[[ -s $rvm_env ]] && source $rvm_env

# add custom prompt
PS1="devinb@ctm-dev $ "

# Directory colors.
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagaced

# directories
alias l='ls -FlG && pwd'
alias ll='ls -aFlG && pwd'
alias ..='cd ..'

# text editors
alias v='vi'

# shortcuts
alias g='git'

# shortcuts - markdown
alias today='~/.bin/today'
alias tomorrow='~/.bin/tomorrow'
alias touchdown='~/.bin/touchdown'

# directories
alias cnagios='cd ~/local-catalog/catalog-nagios/'

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
