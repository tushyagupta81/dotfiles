if status is-interactive
    # Commands to run in interactive sessions can go here
end
# ~/.config/fish/config.fish

set fish_greeting

starship init fish | source
thefuck --alias | source
zoxide init fish --cmd cd | source

source "$HOME/.cargo/env.fish"

alias ls "eza --icons=always"
alias nv "nvim"
alias nconfig "cd ~/.config/nvim"

alias l "ls -la"
alias workspace 'cd ~/Desktop/Programs'
alias n 'newsboat'
alias jn 'jupyter notebook'
alias smysql 'brew services run mysql'
alias qmysql 'brew services stop mysql'
alias c "clear"
alias enva "source venv/bin/activate"
alias envd "deactivate"

if not set -q NVIM
  command fastfetch -c ~/dotfiles/fastfetch_conf.jsonc;
end
