#!/usr/bin/env bash

nix shell nixpkgs#home-manager --command sh -c "\
  home-manager switch --flake ./wsl-home#tushya
"
