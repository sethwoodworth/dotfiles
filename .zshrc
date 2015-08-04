HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

export BROWSER="firefox"
export GREP_COLOR="1;35"
export EDITOR="vim"
export VISUAL="vim"
export XDG_CONFIG_HOME="$HOME/.config"

# Less colors
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

setopt autocd
setopt completealiases
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/seth/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz colors compinit promptinit
colors
compinit
promptinit

prompt bart

typeset -U path
path=(~/bin $path)

source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



BASE16_SHELL=/usr/share/base16-shell/base16-paraiso.dark.sh
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

bindkey '^R' history-incremental-search-backward

source ~/.aliases

