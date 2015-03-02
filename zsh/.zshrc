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

# DISABLE AUTOCORRECT
unsetopt correct_all

source $ZSH/oh-my-zsh.sh

PATH=$PATH:~/bin

alias fore='foreman'

alias be='bundle exec'

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'

# text editors
alias md='open -a Mou'

# git alias
alias g='git'
alias gca='git add -A; git commit -a -m "`curl -s http://whatthecommit.com/index.txt`"'

# shortcuts - markdown
alias today='~/bin/today'
alias tomorrow='~/bin/tomorrow'
alias touchdown='~/bin/touchdown'

# directories
alias dnotes='cd ~/dropbox/notes'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# rbenv

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# databases

