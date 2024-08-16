#!/usr/bin/env bash

# check if homebrew's bin exists and if it's not already in the path
if [ -x "/opt/homebrew/bin/brew" ] && [[ ":$path:" != *":/opt/homebrew/bin:"* ]]; then
    export path="/opt/homebrew/bin:$path"
fi

rm -rf ~/.config
mkdir ~/.config

ln -sf ~/dotfiles/nvim ~/.config
ln -sf ~/dotfiles/scripts ~/.config
ln -sf ~/dotfiles/newsboat ~/.config
ln -sf ~/dotfiles/fish ~/.config
ln -sf ~/dotfiles/starship.toml ~/.config

rm -rf ~/.jupyter
ln -sf ~/dotfiles/.jupyter ~

# newsboat -C=~/.config/newsboat/config -u=~/.config/newsboat/urls
