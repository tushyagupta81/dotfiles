#!/usr/bin/env bash
# dotfiles directory
dotfiledir="${HOME}/dotfiles"

# list of files/folders to symlink in ${homedir}
# files=(zprofile bashrc bash_profile aliases p10k.zsh tmux.conf wezterm.lua)
files=(wezterm.lua tmux.conf bashrc)

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd "${dotfiledir}" || exit

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
  echo "Creating symlink to $file in home directory."
  ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

# Run the Homebrew Script
~/dotfiles/exec_arch/yay.sh
# ./nix.sh

# Run the Neovim Script
~/dotfiles/exec_arch/nvim.sh

# Run the terminal Script
~/dotfiles/exec_arch/terminal.sh
