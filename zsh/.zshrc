# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="kolo"

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

# FIXME: workspace in path
# PATH=$PATH:~/workspace

# GOLANG path
export PATH=$PATH:$(go env GOPATH)/bin

# RUST path
export PATH="$HOME/.cargo/bin:$PATH"

alias gsd='cd ~/workspace'

# directories
alias l='ls -FlG'
alias ll='ls -aFlG'

# git alias
alias gap='git add -p'
alias gca='git commit -a -m "`curl -s http://whatthecommit.com/index.txt`"'
alias gst='git status'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# add yarn to PATH
export PATH="$PATH:`yarn global bin`"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pipeline/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/pipeline/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pipeline/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/pipeline/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias g='gradle'

alias kube='kubectl'

export PATH="/usr/local/opt/openssl/bin:$PATH"

eval "$(fasd --init auto)"

