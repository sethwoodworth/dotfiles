ZSH_THEME="sethish"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(extract git vi-mode zsh-syntax-highlighting rbenv)

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Shortcuts * bindkeys
source ~/.bash_aliases
bindkey '^R' history-incremental-search-backward

export EDITOR=vim
export PAGER="most"
export GPGKEY=CA70C079

source ~/.zsh/motd.zsh


## Paths

# GOLANG
export PATH="/usr/local/go/bin:$PATH:$HOME/.go/bin"
export GOPATH="$HOME/.go"
export GOBIN=$GOPATH/bin

# Android
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/bin

# activate autojump
. /usr/share/autojump/autojump.zsh

# enable the karma chrome test runner to find/use chromium for npm test
export CHROME_BIN=/usr/bin/chromium
eval "$(rbenv init -)"
