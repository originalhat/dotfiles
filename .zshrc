#Color table from: http://www.understudy.net/custom.html
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}


PROMPT="
${fg_lgreen}%n@${at_underl}%m${at_underloff}${fg_white}[${fg_cyan}%~${fg_white}]
[${fg_green}%T${fg_white}]:${at_normal}"

#Set the auto completion on
autoload -U compinit
compinit

#Lets set some options
setopt correctall
setopt autocd
setopt auto_resume

## Enables the extgended globbing features
setopt extendedglob

#Set some ZSH styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'
alias ..='cd ..'

# text editors
alias md='open -a Mou'
alias m='mate'
alias v='vi'

# shortcuts
alias g='git'

# shortcuts - markdown
alias today='~/bin/today'
alias tomorrow='~//bin/tomorrow'
alias touchdown='~/bin/touchdown'

# directories
alias cnagios='cd ~/dropbox/ncar/catalog-nagios/'
alias cmodels='cd ~/dropbox/ncar/catalog_models/'
alias dnotes='cd ~/dropbox/notes'

# development
alias ctmd='ssh devinb@ctm-dev'
alias sfed='ssh devinb@sferic-dev'
alias jird='ssh devinb@jiradev'

# operations
alias lito='ssh devinb@lightning'
alias sfeo='ssh devinb@sferic -p 23'
alias jiro='ssh devinb@jira -p 23' # no access