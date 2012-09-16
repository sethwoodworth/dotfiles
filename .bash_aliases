## Shortcuts
# lists
alias l='ls'
alias ll='ls -lhA'
# Extended listing
alias dush='du -sh'
# shortcuts
alias v="vim"
# Yum
alias search='yum search '
alias install='sudo yum install '
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
alias gcm='git commit -m'
alias gp='git push origin master'
alias g?='git status -uno'
alias gc='git log --check'
alias g1='git log --pretty=oneline'
alias gd='git diff --word-diff '
alias gdl='git diff '
alias gls='git ls-files '

## Pseudo scripts
# Share pubkey
alias pubkey='cat ~/.ssh/id_rsa.pub'
## Searching
alias v?="find ./* -name *.swp" # find all swp files unsaved from here up the tree
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
alias shh='ssh'
