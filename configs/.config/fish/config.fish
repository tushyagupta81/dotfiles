# ~/.config/fish/config.fish
set fish_greeting

set -gx FONT "0xProto Nerd Font"
set -gx EDITOR "nvim"
#set -gx FONT "JetBrainsMono Nerd Font"

fish_add_path "$HOME/.config/scripts"
fish_config theme choose vibrant

alias ls "eza --icons=always --color=always"
alias l "eza --icons=always -la --git --color=always"
alias lt "eza --icons=always -Ta -L=2"
alias nv "nvim"
alias e $EDITOR
alias enva "source $HOME/.config/scripts/envactivate.fish"
alias envl "l $HOME/.virtualenv"
alias ide "tmux"
alias wsl-open "bash wsl-open"
alias gl "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

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
abbr --add ff fastfetch -c ~/.config/fastfetch_conf.jsonc --logo-type iterm
abbr --add imgcat wezterm imgcat

# git abbrivations
abbr --add gs git status
abbr --add ga git add
abbr --add gpl git pull
abbr --add gp git push
abbr --add gc git commit -m
abbr --add gr git add -A\;git commit -m

if test -e "$HOME/.cargo/env.fish"
  source "$HOME/.cargo/env.fish"
end

# homebrew setuup
if test -d /home/linuxbrew/.linuxbrew
  set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
else if test -d /opt/homebrew
  set -gx HOMEBREW_PREFIX "/opt/homebrew"
end

if test -n "$HOMEBREW_PREFIX"
  set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
  set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/Homebrew"
  set -gx PATH "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin" $PATH
  set -q MANPATH; or set MANPATH ''
  set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH
  set -q INFOPATH; or set INFOPATH ''
  set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH
  $HOMEBREW_PREFIX/bin/brew shellenv | source
end

# tools init
starship init fish | source
zoxide init fish --cmd cd | source
fzf --fish | source

if status --is-login

end

# tmux on startup and show fastfetch only on startup
if status is-interactive
  if not set -q TMUX
    set sessions (tmux list-sessions -F '#{session_name}' 2>/dev/null)

    if test -n "$sessions"
      if [ "$sessions[1]" = "popup" ]
        tmux kill-session -t "popup"
        set -e IN_TMUX
        exec tmux new-session
      end
      # Attach to the first session
      exec tmux attach-session -t $sessions[1]
    else
      set -e IN_TMUX
      exec tmux new-session
    end
    #exec tmux
  end
  if set -q TMUX && not set -q IN_TMUX
    command fastfetch -c ~/.config/fastfetch_conf.jsonc --logo-type iterm;
    set -Ux IN_TMUX true;
  end
end

# pnpm
set -gx PNPM_HOME "/home/tushya/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
