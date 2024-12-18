#!/bin/bash

sudo apt update -y && apt upgrade -y

# install ZSH
sudo apt install -y git-core zsh curl
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install ZSH plugins
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions
fi

# Change shell
if [[ "$SHELL" != */zsh ]]; then
    chsh -s "$(which zsh)"
fi

exec $SHELL
