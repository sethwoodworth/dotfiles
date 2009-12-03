#!/bin/bash

# ssh setup and publication
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -b 2525 -r rsa -C "Seth Woodworth seth@sethirl.com"
fi

# get my repo of config files
sudo aptitude update && sudo aptitude install git-core
cd ~
git clone

# install my standard apps
sudo aptitude install audacity build-essential git-core gnome-do gpw gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly inkscape markdown mplayer mplayer-nogui screen-profiles signing-party subversion synergy w32codecs

# set up my python env
sudo aptitude install python2.5 python2.6 python-beautifulsoup python-crypto python-feedparser python-matplotlib python-networkx python-markdown python-pygraphviz python-rsvg python-sqlalchemy python-yaml 

# set up ruby env
sudo aptitude install ruby1.8 rubygems rubygems1.8
