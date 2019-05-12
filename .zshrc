# = Sethwolfwood zshrc
# github.com/sethwoodworth/dotfiles
unsetopt beep

# Zsh options
setopt autocd
setopt completealiases # Lets me tab complete aliases
setopt inc_append_history
setopt share_history

# `cd` paths
cdpath=($HOME/code)

# == History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
# Binds C-r to search backwards through shell history
bindkey '^R' history-incremental-search-backward

# Zsh autoload extensions and configs
autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line

autoload -Uz colors compinit
colors
compinit


zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*' menu select


source /etc/zsh_command_not_found

# Load fzf shortcuts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerline
powerline-daemon -q

setopt PROMPT_SUBST

source /usr/lib/git-core/git-sh-prompt
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT="
%B%F{red}┍━━━⎧⦇ %F{white}%n%F{red} :: %F{yellow}$(__git_ps1 "%s")%F{red} ⦈━(%F{white}%j%F{red})━[ %F{white}%~%F{red} ]
╘═══⎩%b%f "


# Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Path settings
PATH="/home/${USER}/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/home/${USER}/.local/bin:$PATH"
# dasht
PATH="$PATH:/home/${USER}/.local/share/dasht/bin"
export PATH

export MANPATH="$MANPATH:/home/${USER}/.local/dasht/man"


# Load a fortune on term launch
fortune ~/.config/fortune/

[ -s "/home/${USER}/.local/bin/aws_zsh_completer.sh" ] && source "/home/${USER}/.local/bin/aws_zsh_completer.sh"

# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

# Source aliases
source "$XDG_CONFIG_HOME/aliases/aliases"
for f (~/.config/zsh/zshrc.d/*) . $f
