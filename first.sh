#!/usr/bin/env zsh
############################
# This script creates symlinks from the home directory to any desired dotfiles in $HOME/dotfiles
# And also installs MacOS Software
# And also installs Homebrew Packages and Casks (Apps)
# And also sets up VS Code
# And also sets up Sublime Text
############################

# dotfiles directory
dotfiledir="${HOME}/dotfiles"

# list of files/folders to symlink in ${homedir}
# files=(zprofile bashrc bash_profile aliases p10k.zsh tmux.conf wezterm.lua)
files=(wezterm.lua)

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd "${dotfiledir}" || exit

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
  echo "Creating symlink to $file in home directory."
  ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ./linux.sh
fi

# Run the MacOS Script
# ./macOS.sh

# Run the Homebrew Script
# ./brew.sh
./nix.sh

# Run VS Code Script
# ./vscode.sh

# Run the Neovim Script
# ./nvim.sh

# Run the terminal Script
# ./terminal.sh
