# apt aliases
alias apt='sudo apt-get install'
alias search='apt-cache search'

# ssh
alias media='ssh -X seth@media.laptop.org'
alias pedal='ssh sethapprox@pedal.laptop.org'
alias hornet='ssh sethapprox@hornet.dreamhost.com'
alias jubilee='ssh onelaptop@jubilee.dreamhost.com'
alias yawner='ssh yawner@hornet.dreamhost.com'
alias lulz='ssh -A seth@lulz.hellosilo.com'
alias toast='ssh -A seth@128.103.147.183'

# lists
alias l='ls -lnh'
alias la='ls -lnhA'

# spelling errors
alias cim='vim'
alias sl='ls'

# music
alias m.='mplayer ./*'
alias m1.='mplayer -channels 1 ./*'

# screen
alias sx='screen -x'

# todo
alias t='todo.sh -d /home/seth/todo/todo.cfg'

# pulseaudio sucks
alias restartpulse='sudo killall -9 pulseaudio; pulseaudio >/dev/null 2>&1 &'

# xmonad
alias pullthestring='killall metacity; xmonad &'
alias dotawesome='killall metacity; awesome-start &'

# Directory changing shortcuts
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias _='cd -'

# Git
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push origin master'
