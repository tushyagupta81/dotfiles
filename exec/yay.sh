#!/usr/bin/env bash

# Define an array of packages to install using Homebrew.
packages_arch=$(grep -o -E "(\w|')+" "$HOME/dotfiles/packages/packages_arch.txt" | sed -e "s/'.*\$//" | sort -u -f)

# Installing yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf ./yay

yay -S ${packages_arch[*]}

echo "Swaping ctrl and caps"
setxkbmap -layout us -option ctrl:swapcaps
