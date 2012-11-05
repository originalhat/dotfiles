# rvm
rvm_env="$HOME/.rvm/scripts/rvm"
[[ -s $rvm_env ]] && source $rvm_env

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

# shortcuts - markdown
alias today='~/Dropbox/dotfiles/bin/today'
alias tomorrow='~/Dropbox/dotfiles/bin/tomorrow'
alias touchdown='~/Dropbox/dotfiles/bin/touchdown'

# directories
alias cnagios='cd ~/dropbox/ncar/catalog-nagios/'
alias cmodels='cd ~/dropbox/ncar/catalog_models/'

# development
alias ctmd='ssh devinb@ctm-dev'
alias sfed='ssh devinb@sferic-dev'
alias jird='ssh devinb@jiradev'

# operations
alias lito='ssh devinb@lightning'
alias sfeo='ssh devinb@sferic -p 23'
alias jiro='ssh devinb@jira -p 23' # no access

# git autocompletion
source ~/Dropbox/dotfiles/bin/.git-completion