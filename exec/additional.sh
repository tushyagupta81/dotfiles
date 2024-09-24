#!/usr/bin/env bash

exec bash

# Add the fish to allowed shells
echo "Changing default shell to fish"
echo "$(which fish)" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew fish as default shell
chsh -s "$(which fish)"

echo "Installing rust"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

echo "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip \
&& cd ~/.local/share/fonts \
&& unzip 0xProto.zip \
&& rm 0xProto.zip \
&& fc-cache -fv

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

fish utils/install-nvm.sh
