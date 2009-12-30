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
echo "Lets set up your home directory with directories"
cd ~

if [ ! -d ~/code ]; then
    echo "didn't have a code directory you should run 'repo-rake'"
    mkdir ~/code
fi

if [ ! -d ~/Documents ]; then
    echo "didn't find a Documents folder, that is unusual"
    echo "you may want to 'fetch-notes'"
    mkdir ~/Documents
fi

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

##### installing packages #####

## install my standard apps
# TODO: Add more pkgs to install for default configs, this isn't everything
# TODO: Split this into media / prog tools / sys-tools as options/flags
sudo aptitude install build-essential bzr git-core gnome-do gpw markdown signing-party subversion unp vim-nox xclip

# media tools
sudo aptitude install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly mpc mpd mplayer mplayer-nogui sox

# if gnome / X.org
sudo aptitude install audacity gconf-editor inkscape synergy 

## set up my python env
echo "You want to play with the python? Mkay, let's get you stuff you'll need for that."
sudo aptitude install python2.5 python2.6 python-beautifulsoup python-crypto python-feedparser python-matplotlib python-networkx python-markdown python-pygraphviz python-rsvg python-sqlalchemy python-yaml 

## set up ruby env
# TODO: add commands here to install the rubygems I use.
echo "I don't need a lot of Ruby tools, but here are what I *absolutely* need."
sudo aptitude install ruby1.8 rubygems rubygems1.8
sudo gem install activerecord yaml

############################################################
################   auth for code repos   ###################
############################################################
#TODO: authenticate with launchpad's bzr

# set up my code folder with some common projects and example code
echo "Setting up a lot of local git repos"
echo "First let's make you able to pull from github &etc"
echo "you're going to want to log in to github and paste the following into the ssh keys"
firefox https://github.com/login?return_to=https%3A%2F%2Fgithub.com%2Faccount
echo "use the hostname as the ssh key title:" $HOSTNAME
echo "and use the gen_rsa.pub to authenticate this machine:"
cat ~/.ssh/gen_rsa.pub
# TODO: add a pause here for user response

echo "adding some github specific config to git config"
git config --global github.user sethwoodworth

#echo "then get your api key from the account page and paste it here"
#TODO: take user input and set it as $TOKEN
#git config --global github.token $TOKEN

echo "fetching some of your code repos to ~/code"
cd ~/code

echo "'mbta-boston-pub' repository from github"
if [ ! -d mbta-boston-pub ]; 
    then
        git clone git@github.com:sethwoodworth/mbta-boston-pub.git
    else
        echo "you already have this repo, I'll update it while I'm here"
        cd mbta-boston-pub
        git-pull origin master
        cd ~/code
fi

echo "'collect-phil-cdc' repository from github"
if [ ! -d collect-phil-cdc ]; 
    then
        git clone git@github.com:sethwoodworth/collect-phil-cdc.git
    else
        echo "you already have this repo, I'll update it while I'm here"
        cd collect-phil-cdc
        git-pull origin master
        cd ~/code
fi

for repo in list of repos-on-github
    echo $repo + " repository from github"
    if [ ! -d $repo ]; 
        then
            git clone git@github.com:sethwoodworth/$repo.git
        else
            echo "you already have this repo, I'll update it while I'm here"
            cd $repo
            git-pull origin master
            cd ~/code
    fi

# TODO: Setup ssh keysharing
# TODO: Add (after sanitizing) program config files (.irssi, etc)
# TODO: check notes into git on private and pull (shallow?) copies to all machines
