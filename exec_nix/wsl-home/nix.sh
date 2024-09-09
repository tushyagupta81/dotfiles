#!/usr/bin/env bash

nix shell nixpkgs#home-manager | sh -c "\
	home-manager switch --flake .#tushya\
"
