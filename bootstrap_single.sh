#!/usr/bin/env bash


#########################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox
#
# Updated by afiniel-tech for yiimpool use...
#
# This script is intended to be ran from the yiimpool installer
#########################################################

# Tag version
if [ -z "${TAG}" ]; then
	TAG=v2.1
fi

# Checks if single installer exist or not, else clone it.
if [ ! -d "$HOME"/yiimpool/yiimp_single ]; then
	echo Downloading yiimpool YiiMP Server Installer ${TAG}. . .
	
	git clone \
		-b ${TAG} --depth 1 \
		https://github.com/afinieldev/yiimpool_yiimp_single \
		$HOME/yiimpool/yiimp_single \
		< /dev/null 2> /dev/null

	echo
fi

# move to yiimp_single directory  
cd $HOME/yiimpool/yiimp_single

# Makes sure it's clones TO $HOME/yiimpool/install      future create ROOT dir for it.
sudo chown -R "$USER" "$HOME"/yiimpool/install/.git/

# IF Tag is equal to Release Tag true; then 
if [ "${TAG}" != "git describe --tags" ]; then
	echo Updating yiimpool YiiMP Single Server Installer to ${TAG} . . .

	# Else False;
	git fetch --depth 1 --force --prune origin tag ${TAG}
	if ! git checkout -q ${TAG}; then
		echo "Update failed. Did you modify something in `pwd`?"
		exit
	fi
	echo
fi

# Start setup script.
cd $HOME/yiimpool/yiimp_single
source start.sh
