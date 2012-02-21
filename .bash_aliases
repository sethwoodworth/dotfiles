## Navigation ##
# lists
alias l='ls'
alias ll='ls -lhA'
# less
alias less='less -r' # this makes less display color
# Extended listing
alias dush='du -sh'
# General directory changing shortcuts
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias ....="cd ../../.."
alias _='cd -'
# GOTO dir(s)
alias code='cd ~/code'
alias doc='cd ~/Documents'
alias music='cd ~/Music'
alias proj='cd ~/Documents/projects/ ; ls'
alias buzz='cd ~/code/buzzient/ ; ls'

## Packages ##
# apt aliases
alias apt='sudo aptitude install'
#alias search='apt-cache search'
alias search='yum search '
alias update='sudo aptitude update'
alias upgrade='sudo aptitude safe-upgrade'
# Share pubkey
alias pubkey='cat ~/.ssh/id_rsa.pub'

## DVCS ##
# Git
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push origin master'
alias g?='git status'
alias gc='git log --check'
alias g1='git log --pretty=oneline'
alias gd='git diff '
alias gls='git ls-files '

## Vim extras
# shortcuts
alias v="vim"

## Searching
alias v?="find ./* -name *.swp" # find all swp files unsaved from here up the tree
alias cleanpyc="find . -type f -name "*.pyc" -exec rm {} \;"

## MISC
# General Spelling mistakes
alias cim='vim_wrapper'
alias sl='ls'
alias shh='ssh'
# Music
alias m.='mplayer ./*'
alias m1.='mplayer -channels 1 ./*'
# grep
#alias ack='ack-grep -H --color'
alias ackpy='ack --python'
# screen
alias sx='screen -x'
# ssh tunneling
alias sshtun="ssh -D 1080 toast"
# tmux
alias tmux="tmux -2"
alias tx="tmux attach"

## Obsolete
# pulseaudio sucks
alias restartpulse='sudo killall -9 pulseaudio; pulseaudio >/dev/null 2>&1 &'
# xmonad
alias pullthestring='killall metacity; xmonad &'
alias dotawesome='killall metacity; awesome-start &'

# Fedora specific aliases
alias pip='pip-python'
