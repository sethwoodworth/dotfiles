## Navigation ##
# lists
alias l='ls'
alias ll='ls -lhA'
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

## Packages ##
# apt aliases
alias apt='sudo aptitude install'
alias search='apt-cache search'
alias update='sudo aptitude update'
alias upgrade='sudo aptitude safe-upgrade'

## DVCS ##
# Git
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push origin master'
alias g?='git status'
alias gc='git log --check'
alias g1='git log --pretty=oneline'
alias gd='git diff '

## Vim extras
# shortcuts
alias v="vim"
alias vi="vim"
# commands to call from vim
alias adate="date +'%Y-%m-%d %H:%M:%S %z'"

## MISC
# General Spelling mistakes
alias cim='vim'
alias sl='ls'
alias shh='ssh'
# Music
alias m.='mplayer ./*'
alias m1.='mplayer -channels 1 ./*'
# grep
alias ack='ack-grep -H'
# screen
alias sx='screen -x'
# ssh tunneling
alias sshtun="ssh -D 1080 toast"

## Obsolete
# pulseaudio sucks
alias restartpulse='sudo killall -9 pulseaudio; pulseaudio >/dev/null 2>&1 &'
# xmonad
alias pullthestring='killall metacity; xmonad &'
alias dotawesome='killall metacity; awesome-start &'
