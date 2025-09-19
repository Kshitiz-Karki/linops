#!/bin/bash

#Configure dotfiles
rm -rf ~/dotfiles
git clone --depth 1 https://github.com/Kshitiz-Karki/dotfiles.git ~/dotfiles >/dev/null

[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak

# Get the path to zsh
ZSH_PATH=$(command -v zsh)
if [[ -z "$ZSH_PATH" ]]; then
  printf "%b\n" "${YELLOW}Zsh installation failed or zsh not found.${RC}"
  exit 1
fi
# Set zsh as the default shell for the current user
sudo chsh -s "$ZSH_PATH" "$USER"

cd ~/dotfiles
for dir in $HOME/dotfiles/*; do
  if [ -d "$dir" ]; then
    stow "$(basename $dir)"
  fi
done
cd -

#setting up utilities
[ ! -d ~/bin ] && mkdir ~/bin
for file in ~/Documents/code/configurator/utilities/*; do sudo cp $file ~/bin; done

if [[ ":$PATH:" == *":$HOME/bin:"* || ":$PATH:" == *":~/bin:"* ]]; then
  echo '~/bin is in PATH'
else
  echo 'export PATH=~/bin:$PATH' >>~/.zshrc
  echo 'export PATH=~/bin:$PATH' >>~/.bashrc
fi
