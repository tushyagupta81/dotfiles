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
$(which git) config --global core.compression 9
$(which git) config --global pull.rebase true
$(which git) config --global core.pager delta
$(which git) config --global interactive.diffFilter 'delta --color-only'
$(which git) config --global delta.navigate true
$(which git) config --global merge.conflictStyle zdiff3
