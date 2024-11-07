#!/usr/bin/env bash

case "$(uname -a)" in
  Darwin*)  machine="darwin" ;; 
  Linux*)   machine="linux" ;;
  Bsd*)     machine="bsd" ;;
  Msys*)    machine="windows" ;;
  Cygwin*)  machine="also windows" ;;
  *)        machine="unknown" ;;
esac

if [ ${machine} == "linux" ]; then
  echo -n "arch or ubuntu(a/u): "
  read arch
  if [ "$arch" == "a" ]; then
    ~/dotfiles/exec/yay.sh
  # elif [ "$arch" == "u" ]; then
  #   ~/dotfiles/exec/apt.sh
  else
    exit
  fi
elif [ ${machine} == "darwin" ]; then
  ~/dotfiles/exec/brew.sh
fi
~/dotfiles/exec/additional.sh

~/dotfiles/exec/configs.sh
~/dotfiles/exec/git.sh

# Run the terminal Script
~/dotfiles/exec/terminal.sh
