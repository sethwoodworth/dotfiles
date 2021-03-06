# = Sethwolfwood zshrc
# github.com/sethwoodworth/dotfiles

# Zsh options
unsetopt beep
# setopt autocd
setopt completealiases # Lets me tab complete aliases
setopt inc_append_history
setopt share_history

# `cd` paths
cdpath=($HOME/code)

# == History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey '^R' history-incremental-search-backward

# Zsh autoload extensions and configs
autoload edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

autoload -Uz colors compinit
colors
compinit

zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*' menu select

# Load a fortune on term launch
[ command -v fortune >/dev/null 2>&1 ] && fortune ~/.config/fortune/

source $XDG_CONFIG_HOME/aliases/aliases
for f (~/.config/zsh/zshrc.d/*) . $f
