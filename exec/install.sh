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
  echo -n "arch or ubuntu or terminal only(a/u/t): "
  read platform
  if [ "$platform" == "a" ]; then
    ~/dotfiles/exec/yay.sh
  elif [ "$platform" == "u" ]; then
    ~/dotfiles/exec/brew.sh
  elif [ "$platform" == "t" ]; then
    ~/dotfiles/exec/terminal.sh
  else
    exit
  fi
elif [ ${machine} == "darwin" ]; then
  ~/dotfiles/exec/brew.sh
fi
~/dotfiles/exec/utils/additional.sh

~/dotfiles/exec/utils/configs.sh
# ~/dotfiles/exec/utils/git.sh
