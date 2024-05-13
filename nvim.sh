#!/usr/bin/env zsh

# check if homebrew's bin exists and if it's not already in the path
if [ -x "/opt/homebrew/bin/brew" ] && [[ ":$path:" != *":/opt/homebrew/bin:"* ]]; then
    export path="/opt/homebrew/bin:$path"
fi

ln -sf ./nvim ~/.config/.nvim
ln -sf ./scripts ~/.config/.scripts
ln -sf ./newsboat ~/.config/.newsboat
