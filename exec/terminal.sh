#!/usr/bin/env bash

packages=$(grep -o -E "(\w|')+" "$HOME/dotfiles/packages/packages_terminal.txt" | sed -e "s/'.*\$//" | sort -u -f)
sudo pacman -S ${packages_arch[*]} --disable-sandbox
