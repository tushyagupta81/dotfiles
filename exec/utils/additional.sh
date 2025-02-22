#!/usr/bin/env bash

# Add the fish to allowed shells
echo "Changing default shell to fish"
echo "$(which fish)" | sudo tee -a /etc/shells >/dev/null
# Set the fish shell as default shell
chsh -s "$(which fish)"

echo "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip \
# && cd ~/.local/share/fonts \
# && unzip 0xProto.zip \
# && rm 0xProto.zip \
# && fc-cache -fv
#
# wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip \
# && cd ~/.local/share/fonts \
# && unzip JetBrainsMono.zip \
# && rm JetBrainsMono.zip \
# && fc-cache -fv

# fish utils/install-nvm.sh
