#!/bin/bash

#Configure dotfiles
rm -rf ~/dotfiles
git clone --depth 1 https://github.com/Kshitiz-Karki/dotfiles.git ~/dotfiles >/dev/null

cd ~/dotfiles
# for dir in $HOME/dotfiles/*; do
#   if [ -d "$dir" ]; then
#     stow "$(basename $dir)"
#   fi
# done
stow zoxide
stow zsh
stow zshrc
cd -
