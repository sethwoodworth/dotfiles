ZSH_THEME="sethish"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(extract git vi-mode zsh-syntax-highlighting)

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Shortcuts * bindkeys
source ~/.bash_aliases
bindkey '^R' history-incremental-search-backward

export EDITOR=vim
export PAGER="most"
export GPGKEY=CA70C079
GPG_TTY=`tty`
export GPG_TTY

source ~/.zsh/motd.zsh


## Paths

export PATH="~/bin/:$PATH"

# GOLANG
export PATH="/usr/local/go/bin:$PATH:$HOME/.go/bin"
export GOPATH="$HOME/.go"
export GOBIN=$GOPATH/bin

# Android
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/bin

# enable the karma chrome test runner to find/use chromium for npm test
export CHROME_BIN=/usr/bin/chromium



#source ~/.litograph_env
#source ~/.secrets

# added by travis gem
[ -f /home/seth/.travis/travis.sh ] && source /home/seth/.travis/travis.sh

PATH="/home/seth/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/seth/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/seth/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/seth/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/seth/perl5"; export PERL_MM_OPT;

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
