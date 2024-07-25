#!/usr/bin/env zsh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sh <(curl -L https://nixos.org/nix/install) --daemon
else
  sh <(curl -L https://nixos.org/nix/install)
fi

if [ -d "${HOME}/.config" ]; then
  if [ -d "${HOME}/.config/nix" ]; then
    if [ -f "${HOME}/.config/nix/nix.conf" ]; then
      echo "experimental-features = nix-command flakes" >> "${HOME}"/.config/nix/nix.conf
    else
      touch "${HOME}"/.config/nix/nix.conf
      echo "experimental-features = nix-command flakes" >> "${HOME}"/.config/nix/nix.conf
    fi
  else
    mkdir "${HOME}"/.config/nix
    touch "${HOME}"/.config/nix/nix.conf
    echo "experimental-features = nix-command flakes" >> "${HOME}"/.config/nix/nix.conf
  fi
else
  mkdir "${HOME}"/.config
  mkdir "${HOME}"/.config/nix
  touch "${HOME}"/.config/nix/nix.conf
  echo "experimental-features = nix-command flakes" >> "${HOME}"/.config/nix/nix.conf
fi

exec zsh -l

packages=(
    "python3"
    "bash"
    "zsh"
    "eza"
    "git"
    "node"
    "newsboat"
    "btop"
    "mysql"
    "ripgrep"
    "thefuck"
    "gcc"
    "mpv"
    "neovim"
    "tmux"
    "nvm"
    "luarocks"
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

# Add the Homebrew zsh to allowed shells
echo "Changing default shell to Homebrew zsh"
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew zsh as default shell
chsh -s "$(brew --prefix)/bin/zsh"

# Git config name
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

# Git config email
echo "Please enter your EMAIL for Git configuration:"
read git_user_email

# Set my git credentials
$(brew --prefix)/bin/git config --global user.name "$git_user_name"
$(brew --prefix)/bin/git config --global user.email "$git_user_email"

