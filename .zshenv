export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export GREP_COLOR="1;35"

export ANSIBLE_NOCOWS=1

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

export GOPATH=~/go

typeset -U path

# path=(
PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:$GOPATH/bin"
PATH="/home/${USER}/.local/share/google-cloud-sdk/bin:${PATH}"
PATH="$XDG_DATA_HOME/pyenv/bin:$PATH"
# Path settings
PATH="/home/${USER}/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/home/${USER}/.local/bin:$PATH"
export PATH
