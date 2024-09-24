#!/usr/bin/env bash

# dotfiles directory
dotfiledir="${HOME}/dotfiles"

# list of files/folders to symlink in ${homedir}
files="${HOME}/dotfiles/configs/home"

if [ -d "$HOME/.jupyter" ]; then
  rm -rf "$HOME/.jupyter"
fi

for file in "${files}"/.* "${files}"/*; do
  if [ -f "$file" ] && [ "$(basename "$file")" != "." ] && [ "$(basename "$file")" != ".." ]; then
    echo "Creating symlink to $file in home directory."
    ln -sf "${file}" "${HOME}/$(basename "$file")"
  elif [ -d "$file" ] && [ "$(basename "$file")" != "." ] && [ "$(basename "$file")" != ".." ]; then
    echo "Creating symlink to $file in home directory."
    ln -sf "${file}" "${HOME}/$(basename "$file")"
  fi
done

configs="${HOME}/dotfiles/configs/.config"

if [ ! -d "$HOME/.config" ]; then
  mkdir ~/.config
fi
if [ -d "$HOME/.config/fish" ]; then
  rm -rf "$HOME/.config/fish"
fi

for file in "${configs}"/.* "${configs}"/*; do
  if [ -f "$file" ] && [ "$(basename "$file")" != "." ] && [ "$(basename "$file")" != ".." ]; then
    echo "Creating symlink to $file in home directory."
    ln -sf "${file}" "${HOME}/.config/$(basename "$file")"
  elif [ -d "$file" ] && [ "$(basename "$file")" != "." ] && [ "$(basename "$file")" != ".." ]; then
    echo "Creating symlink to $file in home directory."
    ln -sf "${file}" "${HOME}/.config/$(basename "$file")"
  fi
done
