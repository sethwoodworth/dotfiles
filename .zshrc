# = Sethwolfwood zshrc, arch branch
# github.com/sethwoodworth/dotfiles

# = Assorted exports
export XDG_CONFIG_HOME="$HOME/.config"
export BROWSER="firefox"
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

unsetopt beep

zstyle :compinstall filename '/home/seth/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz colors compinit  zmv run-help
colors
compinit

source /usr/bin/liquidprompt

typeset -U path
path=(~/bin $path)

source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



BASE16_SHELL=/usr/share/base16-shell/base16-paraiso.dark.sh
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line

# FIXME: remove the following alises to config dir
source ~/.aliases
# FIXME: use XDG_CONFIG_DIR
source ~/.config/aliases/aliases
source ~/bin/choosetheme

set_theme `cat ${DEFAULT_THEME}`
set_bg `cat ${DEFAULT_BG}`

fortune ~/.config/fortune/
