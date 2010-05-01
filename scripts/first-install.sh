#!/bin/bash

# ssh setup and publication
if [ ! -f ~/.ssh/gen_rsa ]; then
    ssh-keygen -b 2525 -f ~/.ssh/gen_rsa
    chmod 700 ~/.ssh/gen_rsa*
    chmod 700 ~/.ssh/known_hosts
    ssh-add ~/.ssh/*
fi

## Config files
# setup ~/ first
cd ~
if [ ! -d ~/.backup ]; then
    mkdir ~/.backup
fi

if [ ! -d ~/scripts/.backup ]; then
    mkdir ~/scripts/.backup
fi

if [ -f /usr/lib/git-core/git-clone ]; 
    then
        echo \n\n\n"Good, git is installed. Lets clone your dotfiles and setup."\n\n\n
    else
        echo "I need to install git before we can proceed."
        sudo aptitude update && yes | sudo aptitude install git-core
        echo "configuring git ..."
        git config --global user.name "Seth Woodworth"
        git config --global user.email "seth@isforinsects.com"
fi

if [ ! -d ~/.git ]; 
    then
        echo "Cloning the usual configs."
        git clone git://github.com/sethwoodworth/dotfiles.git
    else
        echo \n\n Seems like you\'ve pulled the configs before? Lets just update them and see if that gets you what you were looking for.
        git pull origin master
fi

cd dotfiles
git remote add origin git@github.com:sethwoodworth/dotfiles.git

# Backup any file I'm copying over from the git repo
echo "Good. Did you have anything you needed to backup? Current .bash configs maybe? Lemme back them up for you."
for f in ./.*; do
    mv ~/$f ~/.backup/
done


echo "Mkay, got that. Now lets move things where they belong in ~."
mv ./scripts/* ../scripts/*
mv ./.* ../
# mv ./* ../    # I don't have any files that *don't* start with . so far

echo \n\n\n\n  There, those are the basic configs to make things more comfortable. Now onto installing some functionality.  \n\n\n\n

####################################################
##########   Split into two scripts here   #########
####################################################

## install my standard apps
# TODO: Add more pkgs to install for default configs, this can't be everything I use.
# TODO: Split this into media / prog tools / sys-tools
sudo aptitude install audacity build-essential git-core gnome-do gpw inkscape markdown screen-profiles signing-party subversion synergy ntp

# media tools
sudo aptitude install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly mpc mpd mplayer mplayer-nogui 

## set up my python env
echo "You want to play with the python? Mkay, let's get you stuff you'll need for that."
sudo aptitude install python2.5 python2.6 python-beautifulsoup python-crypto python-feedparser python-matplotlib python-networkx python-markdown python-pygraphviz python-rsvg python-sqlalchemy python-yaml 

## set up ruby env
# TODO: add commands here to install the rubygems I use.
echo "I don't need a lot of Ruby tools, but here are what I *absolutely* need."
sudo aptitude install ruby1.8 rubygems rubygems1.8
sudo gem install activerecord yaml

## setup web dev
# TODO: everything
echo "setting up web dev tools"
sudo aptitude install php5-cli

# TODO: Setup ssh configs
# TODO: Add more program config files
# TODO: Add common git repos to my ~/code folder
# ?TODO: add more standard folders?
# TODO: Start checking daily notes into git repo on private machine and pull {shallow?} copies to all machines
