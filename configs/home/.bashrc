if [ -d "/opt/homebrew" ]; then
  set HOMEBREW_PREFIX="/opt/homebrew"
elif [ -d "/home/linuxbrew/.linuxbrew" ]; then
  set HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

set FONT="CommitMono Nerd Font"
set EDITOR="nvim"
set MANPAGER='nvim +Man!'

export PATH=~/.config/scripts:$PATH

alias ls="eza --icons=always --color=always"
alias l="eza --icons=always -la --git --color=always"
alias lt="eza --icons=always -Ta -L=2"
alias nv="nvim"
alias e=$EDITOR
alias ide="tmux"
alias wsl-open="bash wsl-open"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

alias nconfig="cd ~/.config/nvim"
alias ws="cd ~/programs"
alias n="newsboat"
alias jl="jupyter lab"
alias smysql="brew services run mysql"
alias qmysql="brew services stop mysql"
alias sjl="brew services run jupyterlab"
alias qjl="brew services stop jupyterlab"
alias c="clear"
alias cd..="cd .."
alias envd="deactivate"
alias pre="fzf --preview=\"bat --color=always {}\""
alias ff="fastfetch -c ~/.config/fastfetch_conf.jsonc --logo-type iterm"
alias imgcat="wezterm imgcat"
alias enva="source .venv/bin/activate"

# git abbrivations
alias gs="git status"
alias ga="git add"
alias gpl="git pull"
alias gp="git push"
alias gc="git commit -m"
alias gr="git add -A\;git commit -m"

eval "$(zoxide init bash --cmd cd)"
eval "$(starship init bash)"
eval "$(fzf --bash)"
eval "$(uv generate-shell-completion bash)"
