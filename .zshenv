# Locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

# Editors
export EDITOR="nvim"
# because this is set, `bindkey -v` is implicit
export VISUAL="nvim"

# Colorize less for man
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

# Highlight grep match
export GREP_COLOR="1;35"

# config PATH
typeset -U path

# path=(
PATH="${HOME}/bin:$PATH"
PATH="${HOME}/.local/bin:$PATH"
PATH="/usr/local/bin:$PATH"
export PATH

export ANSIBLE_NOCOWS=1
export NPM_PACKAGES="${HOME}/.local/share/npm_packages"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"

# export GOPATH=~/go
# PATH="$PATH:$GOPATH/bin"
# PATH="/home/${USER}/.local/share/google-cloud-sdk/bin:${PATH}"
