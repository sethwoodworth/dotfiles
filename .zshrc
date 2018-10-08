# = Sethwolfwood zshrc, arch branch
# github.com/sethwoodworth/dotfiles

# = Assorted exports
export XDG_CONFIG_HOME="$HOME/.config"
export GREP_COLOR="1;35"

# == Editor
# Vim, of course
export EDITOR="vim"
# because this is set, `bindkey -v` is implicit
export VISUAL="vim"

# Less colors
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

# == Enabling zsh features
setopt autocd          # Allows for `/tmp` to act as `cd /tmp`
setopt completealiases # Lets me tab complete aliases

# == History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# Binds C-r to search backwards through shell history
bindkey '^R' history-incremental-search-backward
# These write shell history after running a command and makes history
# available to new shells when they run history.
# This does not make that history available to C-r
setopt inc_append_history
setopt share_history

#== Adds ability to edit current line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line


unsetopt beep

zstyle :compinstall filename '/home/seth/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz colors compinit
colors
compinit

typeset -U path
path=(~/bin $path)

source /etc/zsh_command_not_found
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

BASE16_SHELL=/usr/share/base16-shell/base16-paraiso.dark.sh
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source "$XDG_CONFIG_HOME/aliases/aliases"

#== Other programs
# GO config
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

# Load fzf shortcuts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerline
powerline-daemon -q
source /usr/share/powerline/bindings/zsh/powerline.zsh

# added by Anaconda3 installer
# export PATH="/home/swoodworth/.anaconda/bin:$PATH"

# Pyenv
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
PATH="$XDG_CONFIG_HOME/pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Path settings
PATH="/home/${USER}/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/home/${USER}/.local/bin:$PATH"

# gcloud bin

PATH="/home/${USER}/.local/share/google-cloud-sdk/bin:${PATH}"
# Source tmuxp
# eval "$(_TMUXP_COMPLETE=source tmuxp)"
export TMUXP_CONFIGDIR="${XDG_CONFIG_HOME}/.config/tmuxp"

# python -c "import site; import os; print(os.path.join(site.USER_BASE, 'bin'))"
export PATH
# Load a fortune on term launch
fortune ~/.config/fortune/

[ -s "/home/swoodworth/.local/share/scm_breeze/scm_breeze.sh" ] && source "/home/swoodworth/.local/share/scm_breeze/scm_breeze.sh"
