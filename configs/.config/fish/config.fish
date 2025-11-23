# ~/.config/fish/config.fishS
set fish_greeting

set -gx FONT "CommitMono Nerd Font"
set -gx EDITOR "nvim"
set -gx MANPAGER 'nvim +Man!'

fish_add_path "$HOME/.config/scripts"
fish_add_path "$HOME/.bin"
fish_config theme choose vibrant

# alias ls "eza --icons=always --color=always --oneline"
alias ls "lsd"
# alias l "eza --icons=always -la --git --color=always"
alias l "lsd -la"
# alias lt "eza --icons=always -Ta -L=2 --git-ignore"
alias lt "lsd --tree"
alias e $EDITOR
alias ide "tmux"
alias wsl-open "bash wsl-open"
alias gl "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias y "yazi"

abbr --erase (abbr --list)

abbr --add nc cd ~/.config/nvim
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
abbr --add enva source .venv/bin/activate.fish

# git abbrivations
abbr --add gs git status --short
abbr --add ga git add
abbr --add gd "git diff --output-indicator-new=' ' --output-indicator-old=' '"
abbr --add gpl git pull
abbr --add gp git push
abbr --add gc git commit -m
abbr --add gcs git commit -S -m
abbr --add gr git add -A\;git commit -m
abbr --add grs git add -A\;git commit -S -m

# Podman commands
abbr --add pc podman compose

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

# function y
# 	set tmp (mktemp -t "yazi-cwd.XXXXXX")
# 	yazi $argv --cwd-file="$tmp"
# 	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
# 		builtin cd -- "$cwd"
# 	end
# 	rm -f -- "$tmp"
# end

# tools init
starship init fish | source
zoxide init fish --cmd cd | source
fzf --fish | source
uv generate-shell-completion fish | source

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
set -gx PNPM_HOME "~/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
