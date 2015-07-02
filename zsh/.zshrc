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
plugins=(gitifast)

# DISABLE AUTOCORRECT
unsetopt correct_all

# zsh magic
source $ZSH/oh-my-zsh.sh

# bin in path
PATH=$PATH:~/bin

# foreman
alias f='bundle exec foreman'
alias fs='bundle exec foreman start'
alias fr='bundle exec foreman run'

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'

# text editors
alias md='open -a Mou'

# git alias
alias g='git'
alias gca='git add -A; git commit -a -m "`curl -s http://whatthecommit.com/index.txt`"'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

