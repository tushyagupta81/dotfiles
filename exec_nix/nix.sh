#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf \
  -L https://install.determinate.systems/nix \
  | sh -s -- install

nix-shell nixpkgs#home-manager --command sh -c "\
  home-manager switch --flake ./wsl-home#tushya
"

# Add the Homebrew fish to allowed shells
echo "Changing default shell to fish"
echo "$(which fish)" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew fish as default shell
chsh -s "$(which fish)"

~/dotfiles/exec_nix/nvim.sh
