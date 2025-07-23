# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.local/share/../bin/env"
