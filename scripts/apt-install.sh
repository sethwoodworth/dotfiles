#!/bin/bash

## minimum required functionality
sudo aptitude install vim-nox

## install my standard apps
# TODO: Add more pkgs to install for default configs, this can't be everything I use.
# TODO: Split this into media / prog tools / sys-tools
sudo aptitude install audacity build-essential git-core gnome-do gpw inkscape markdown screen-profiles signing-party subversion synergy

# media tools
sudo aptitude install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly mpc mpd mplayer mplayer-nogui 

# Development libraries
sudo aptitude install libxml2 libxml2-dev

## Language agnostic prog tools
sudo aptitude install sqlite3

## set up my python env
echo "You want to play with the python? Mkay, let's get you stuff you'll need for that."
sudo aptitude install python2.5 python2.6 python-beautifulsoup python-crypto python-feedparser python-matplotlib python-networkx python-markdown python-pygraphviz python-rsvg python-sqlalchemy python-yaml 

## set up ruby env
# TODO: add commands here to install the rubygems I use.
echo "I don't need a lot of Ruby tools, but here are what I *absolutely* need."
sudo aptitude install ruby1.8 rubygems rubygems1.8 ruby1.8-dev
sudo gem install activerecord json sinatra yaml

