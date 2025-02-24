#!/usr/bin/env bash

packages=$(awk '{printf "%s ", $0}' $HOME/dotfiles/packages/packages_terminal.txt)
sudo pacman -S ${packages[*]} --disable-sandbox
