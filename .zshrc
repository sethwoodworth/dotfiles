# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallifrey"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(django extract git pip vi-mode virtualenvwrapper zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source ~/.bash_aliases

bindkey '^R' history-incremental-search-backward

export PATH=$PATH:/usr/local/go/bin
export GPGKEY=CA70C079
