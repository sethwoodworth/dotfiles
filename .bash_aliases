
## Shortcuts
# lists
alias l='ls'
alias ll='ls -lhA'
# Extended listing
alias dush='du -sh'
# shortcuts
alias v="vim"
alias vag="vagrant"
# Yum
alias search='aptitude search '
alias install='sudo aptitude install '
# General directory changing shortcuts
alias j='autojump'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias ....="cd ../../.."
# Music
alias m.='mplayer ./*'
alias m1.='mplayer -channels 1 ./*'
# grep
#alias ack='ack-grep -H --color' # ack comes as ack in fedora
alias ackpy='ack --python'
# tmux
alias tx="tmux attach"
# Git
alias ga='git add'
alias g+='git add'
alias gba='git branch --all'
alias gcm='git commit -m'
alias gp='git push origin master'
alias gs='git status -uno'
alias gsu='git status'
alias gc='git log --check'
alias g1='git log --pretty=oneline'
alias gd='git diff --word-diff '
alias gdl='git diff '
alias gls='git ls-files '

## Pseudo scripts
# Share files in the current directory as my IP:8080
alias share='python -m SimpleHTTPServer 8080'
# Share pubkey
alias pubkey='cat ~/.ssh/id_rsa.pub'
## Searching
alias vv="find ./* -name *.swp" # find all swp files unsaved from here up the tree
alias rmpyc="find . -name '*.pyc' | xargs rm"
# TODO: add a ls and prompt for delete before rm'ing
alias rmsql="rm ./*.sqlite"
# pulseaudio sucks
alias restartpulse='sudo killall -9 pulseaudio; pulseaudio >/dev/null 2>&1 &'

## Setting color defaults
# less
alias less='less -r' # this makes less display color


## Spelling mistakes
alias cim='vim'
alias sl='ls'
alias shh='echo "no you shush";ssh'

## OSX shortcuts
alias updatedb='sudo /usr/libexec/locate.updatedb'

# Start and stop postgres
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /var/log/postgresql/psql.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop"

# store raw vim character input into a file for analysis later
#alias vim='vim -w ~/.vimlog "$@"'
alias vim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vimdiff='nvim -d'

# python3.4
alias p3='python3.4 '
alias pyvenv='pyvenv-3.4'
alias vs='source venv/bin/activate'
alias mkv='virtualenv venv'
alias cdv='cd venv/lib/python*/site-packages'

# debian
alias whatprovides='dpkg -S '
alias provieswhat='dpkg -L'

alias yapf='python /usr/local/lib/python2.7/dist-packages/yapf'
