#!/usr/bin/env bash

# check if homebrew's bin exists and if it's not already in the path
if [ -x "/opt/homebrew/bin/brew" ] && [[ ":$path:" != *":/opt/homebrew/bin:"* ]]; then
    export path="/opt/homebrew/bin:$path"
fi

if [ ! -d "$HOME/.config" ]; then
    mkdir ~/.config
fi
if [ ! -d "$HOME/.nvm" ]; then
    mkdir ~/.nvm
fi

ln -sf ~/dotfiles/configs/nvim ~/.config
ln -sf ~/dotfiles/configs/newsboat ~/.config
ln -sf ~/dotfiles/configs/fish ~/.config
ln -sf ~/dotfiles/configs/i3 ~/.config
ln -sf ~/dotfiles/configs/rofi ~/.config
ln -sf ~/dotfiles/configs/picom ~/.config
ln -sf ~/dotfiles/configs/polybar ~/.config

ln -sf ~/dotfiles/scripts ~/.config
ln -sf ~/dotfiles/starship.toml ~/.config

rm -rf ~/.jupyter
ln -sf ~/dotfiles/configs/.jupyter ~

# newsboat -C=~/.config/newsboat/config -u=~/.config/newsboat/urls
