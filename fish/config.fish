# ~/.config/fish/config.fish
set fish_greeting

source "$HOME/.cargo/env.fish"

fish_add_path "$HOME/dotfiles/scripts"

alias ls "eza --icons=always"
alias nv "nvim"
alias nconfig "cd ~/.config/nvim"

alias l "ls -la"
alias lt "ls -T -L=2"
alias workspace 'cd ~/programs'
alias n 'newsboat'
alias jn 'jupyter notebook'
alias smysql 'brew services run mysql'
alias qmysql 'brew services stop mysql'
alias c "clear"
alias enva ". venv/bin/activate.fish"
alias envd "deactivate"

if test -d /home/linuxbrew/.linuxbrew
  # Homebrew is installed on Linux

  set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
  set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
  set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
  set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH
  set -q MANPATH; or set MANPATH ''
  set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
  set -q INFOPATH; or set INFOPATH ''
  set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH

  # Homebrew asked for this in order to `brew upgrade`
  # set -gx HOMEBREW_GITHUB_API_TOKEN {api token goes here, don't remember where that's created}
else if test -d /opt/homebrew
  # Homebrew is installed on MacOS
  /opt/homebrew/bin/brew shellenv | source
end

if not set -q TMUX
  command fastfetch -c ~/dotfiles/fastfetch_conf.jsonc;
end

starship init fish | source
thefuck --alias | source
zoxide init fish --cmd cd | source

if status is-interactive
  # Commands to run in interactive sessions can go here
end
