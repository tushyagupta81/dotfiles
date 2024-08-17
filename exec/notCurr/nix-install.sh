#!/usr/bin/env bash

packages=(
  "fastfetch"
  "python3"
  "eza"
  "git"
  "newsboat"
  "btop"
  "mysql84"
  "ripgrep"
  "thefuck"
  "libgcc"
  "mpv"
  "neovim"
  "luajitPackages.luarocks"
  "lazygit"
  "zoxide"
  "fzf"
  "starship"
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
  echo "Installing $package..."
  nix-env -iA nixpkgs."$package"
done

echo "Changing default shell to zsh"
echo "$(which zsh)" | sudo tee -a /etc/shells >/dev/null
chsh -s "$(which zsh)"

# Git config name
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

# Git config email
echo "Please enter your EMAIL for Git configuration:"
read git_user_email

# Set my git credentials
git config --global user.name "$git_user_name"
git config --global user.email "$git_user_email"
