#!/usr/bin/env bash

# Define an array of packages to install using Homebrew.
packages_arch=$(awk '{printf "%s ", $0}' $HOME/dotfiles/packages/packages_arch.txt)

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
