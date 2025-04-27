#!/usr/bin/env bash

# Git config name
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

# Git config email
echo "Please enter your EMAIL for Git configuration:"
read git_user_email

# Set my git credentials
$(which git) config --global user.name "$git_user_name"
$(which git) config --global user.email "$git_user_email"

$(which git) config --global pull.rebase true
$(which git) config --global pull.default current

# $(which git) config --global core.pager delta
$(which git) config --global core.compression 9
$(which git) config --global core.whitespace error
$(which git) config --global core.preloadindex true

# $(which git) config --global interactive.diffFilter 'delta --color-only'

# $(which git) config --global delta.navigate true

# $(which git) config --global merge.conflictStyle zdiff3

$(which git) config --global init.defaultBranch main

$(which git) config --global status.showUntrackedFiles true
$(which git) config --global status.showStash true

$(which git) config --global push.autoSetupRemote true
$(which git) config --global push.default current

$(which git) config --global push.default current
