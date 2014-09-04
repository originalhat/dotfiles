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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH # Include ~/bin/ in PATH
export PATH=/usr/local/share/npm/bin:$PATH
export JAVA_HOME="$(/usr/libexec/java_home)"

JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home"

# rvm
rvm_env="$HOME/.rvm/scripts/rvm"
[[ -s $rvm_env ]] && source $rvm_env

alias rake='noglob rake'

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

alias tail-stage='ssh itsquik@10.210.194.192 tail -f /usr/local/ordernow/httpd/htdocs/splickitweb/current/log/staging.log'

