#!/bin/bash

cd ./assets

# backup and configuration of personal aliases
cp ~/.oh-my-zsh/custom/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh.bak
cp configs/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

./profiles.sh
./tools.sh