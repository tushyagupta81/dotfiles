#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get upgrade -y

packages=$(grep -o -E "(\w|')+" "$HOME/dotfiles/packages.txt" | sed -e "s/'.*\$//" | sort -u -f)
sudo apt install ${packages[*]}
