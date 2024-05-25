#!/usr/bin/env zsh

# check if homebrew's bin exists and if it's not already in the path
if [ -x "/opt/homebrew/bin/brew" ] && [[ ":$path:" != *":/opt/homebrew/bin:"* ]]; then
    export path="/opt/homebrew/bin:$path"
fi

ln -sf ~/dotfiles/nvim ~/.config
ln -sf ~/dotfiles/scripts ~/.config
ln -sf ~/dotifles/newsboat ~/.config

newsboat -C=~/.config/newsboat/config -u=~/.config/newsboat/urls
