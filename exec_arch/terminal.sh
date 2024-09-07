#!/usr/bin/env bash

# echo "Simlinking zshrc to root"
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "Installing plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
