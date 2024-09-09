# ~/.config/fish/config.fish
set fish_greeting

source "$HOME/.cargo/env.fish"

fish_add_path "$HOME/dotfiles/scripts"
fish_config theme choose vibrant

alias ls "eza --icons=always"
alias l "eza --icons=always -la"
alias lt "eza --icons=always -Ta -L=2"
alias nv "nvim"
alias enva "source $HOME/dotfiles/scripts/envactivate"
alias envl "l $HOME/.virtualenv"

abbr --erase (abbr --list)
abbr --add nconfig cd ~/.config/nvim
abbr --add ws cd ~/programs
abbr --add n newsboat
abbr --add jl jupyter lab
abbr --add smysql brew services run mysql
abbr --add qmysql brew services stop mysql
abbr --add sjl brew services run jupyterlab
abbr --add qjl brew services stop jupyterlab
abbr --add c clear
abbr --add cd.. cd ..
abbr --add envd deactivate
abbr --add pre fzf --preview=\"bat --color=always {}\"

abbr --add gs git status
abbr --add ga git add
abbr --add gp git push
abbr --add gc git commit -m
abbr --add gr git add .\;git commit -m


if status is-interactive
  # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/tushya/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
