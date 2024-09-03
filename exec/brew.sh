#!/usr/bin/env bash

# Install Homebrew if it isn't already installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not installed. Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Attempt to set up Homebrew PATH automatically for this session
    if [ -x "/opt/homebrew/bin/brew" ]; then
      # For Apple Silicon Macs
      echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
      export PATH="/opt/homebrew/bin:$PATH"
    fi
  else
    echo "Homebrew is already installed."
fi

# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
  # echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually."
  # exit 1
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc
fi

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
if [[ "$OSTYPE" != "linux-gnu" ]]; then
  brew upgrade --cask
fi
brew cleanup

# Define an array of packages to install using Homebrew.
packages=(
  "python"
  "fish"
  "pnpm"
  "bat"
  "tmux"
  "fastfetch"
  "eza"
  "git"
  "node"
  "newsboat"
  "btop"
  "mysql"
  "ripgrep"
  "thefuck"
  "mpv"
  "neovim"
  "gcc"
  "luarocks"
  "lazygit"
  "zoxide"
  "fzf"
  "starship"
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
  if brew list --formula | grep -q "^$package\$"; then
    echo "$package is already installed. Skipping..."
  else
    echo "Installing $package..."
    brew install "$package"
  fi
done

# Add the Homebrew fish to allowed shells
echo "Changing default shell to Homebrew fish"
echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew fish as default shell
chsh -s "$(brew --prefix)/bin/fish"

# Git config name
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

# Git config email
echo "Please enter your EMAIL for Git configuration:"
read git_user_email

# Set my git credentials
$(brew --prefix)/bin/git config --global user.name "$git_user_name"
$(brew --prefix)/bin/git config --global user.email "$git_user_email"

echo "Installing rust"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

echo "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fish utils/install-nvm.sh

# Define an array of applications to install using Homebrew Cask.
apps=(
  # "google-chrome"
  "firefox"
  # "brave-browser"
  # "sublime-text"
  "visual-studio-code"
  # "virtualbox"
  "spotify"
  "discord"
  "wezterm"
  "raycast"
  "dockey"
  "shottr"
  # "google-drive"
  # "gimp"
  # "vlc"
  # "rectangle"
  "postman"
  "docker"
  "whatsapp"
)
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Loop over the array to install each application.
  for app in "${apps[@]}"; do
    if brew list --cask | grep -q "^$app\$"; then
      echo "$app is already installed. Skipping..."
    else
      echo "Installing $app..."
      brew install --cask "$app"
    fi
  done

    # Install Source Code Pro Font
    # Tap the Homebrew font cask repository if not already tapped
    brew tap | grep -q "^homebrew/cask-fonts$" || brew tap homebrew/cask-fonts

    # Define the font name
    font_name="font-source-code-pro"

    # Check if the font is already installed
    if brew list --cask | grep -q "^$font_name\$"; then
      echo "$font_name is already installed. Skipping..."
    else
      echo "Installing $font_name..."
      brew install --cask "$font_name"
    fi
fi

# Update and clean up again for safe measure
brew update
brew upgrade
if [[ "$OSTYPE" != "linux-gnu" ]]; then
  brew upgrade --cask
fi
brew cleanup
