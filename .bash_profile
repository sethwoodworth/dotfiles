# Sethish's dotfiles:
# .bash_profile

# .bash_profile is a bash config for when someone logs in remotely.
# 99/100 I don't want a remote user to be any different than a local user.

# if bashrc exists, load that
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
