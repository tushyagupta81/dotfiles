#!/usr/bin/env fish

echo "Installing fisher and nvm"
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
fisher install jorgebucaran/autopair.fish

echo "Installing rust"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

nvm install 22
set --universal nvm_default_version v22.9.0
