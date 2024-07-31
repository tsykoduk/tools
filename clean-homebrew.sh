#!/usr/bin/env bash

echo "THIS WILL REMOVE ALL BREW PACKAGES"

read -p "Are you sure?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "removing all packages"
	brew remove --force $(brew list) --ignore-dependencies 
	brew cleanup
else
	echo "keeping packages and running brew cleanup"
	brew cleanup
fi