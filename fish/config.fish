# ~/.config/fish/config.fish
set fish_greeting

source "$HOME/.cargo/env.fish"

fish_add_path "$HOME/dotfiles/scripts"

abbr --add ls eza --icons=always
abbr --add nv nvim
abbr --add nconfig cd ~/.config/nvim

abbr --add l eza --icons=always -la
abbr --add lt eza --icons=always -Ta -L=2
abbr --add ws cd ~/programs
abbr --add n newsboat
abbr --add jl jupyter lab
abbr --add smysql brew services run mysql
abbr --add qmysql brew services stop mysql
abbr --add sjl brew services run jupyterlab
abbr --add qjl brew services stop jupyterlab
abbr --add c clear
abbr --add enva . .venv/bin/activate.fish
abbr --add envd deactivate
abbr --add pre fzf --preview=\"bat --color=always {}\"

abbr --add gs git status
abbr --add ga git add
abbr --add gp git push

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

if status --is-login
  if not set -q TMUX
    command fastfetch -c ~/dotfiles/fastfetch_conf.jsonc;
  end
end

starship init fish | source
thefuck --alias | source
zoxide init fish --cmd cd | source

if status is-interactive
  # Commands to run in interactive sessions can go here
end
