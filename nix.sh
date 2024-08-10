#!/usr/bin/env bash

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
