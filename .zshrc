# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sethish"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(django extract git pip vi-mode zsh-syntax-highlighting tmuxinator)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source ~/.bash_aliases
source /Library/Ruby/Gems/2.0.0/gems/tmuxinator-0.6.6/completion/tmuxinator.zsh

bindkey '^R' history-incremental-search-backward

export EDITOR=vim
export GPGKEY=CA70C079

export PATH=";/usr/local:/usr/local/bin:/usr/local/sbin:$PATH"



#go, why cant this be simpler
export PATH="/usr/local/go/bin:$PATH:$HOME/.go/bin"
export GOPATH="$HOME/.go"
export GOBIN=$GOPATH/bin

#export PERL_LOCAL_LIB_ROOT="/Users/seth/perl5:$PERL_LOCAL_LIB_ROOT";
#export PERL_MB_OPT="--install_base "/Users/seth/perl5"";
#export PERL_MM_OPT="INSTALL_BASE=/Users/seth/perl5";
#export PERL5LIB="/Users/seth/perl5/lib/perl5:$PERL5LIB";
#export PATH="/Users/seth/perl5/bin:$PATH";



# ------
# Directory history stack
#
# Creates a history stack of every dir you have visited in this terminal. 
#     cd -<tab>
# will list the previous folders
# ------
#
DIRSTACKFILE="$HOME/.cache/zsh/dirs" 
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

#  Dir stack end ^^^^^^^^^
#  -------------------------

source ~/.zsh/motd.zsh

#export RBENV_ROOT=~/.rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#export PATH="/usr/local/heroku/bin:$PATH"
