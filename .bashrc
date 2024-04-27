# If not running interactively, exit script
[[ $- != *i* ]] && return

# Load dotfiles:
for file in ~/.{aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
