#!/bin/bash

#install packages and setup
cd ~/Downloads/

#packages

#brave browser
# add debloat scripts for brave, https://github.com/MulesGaming/brave-debloatinator
sudo mkdir /etc/brave/policies/managed -p
sudo cp ~/Downloads/configurator/configs/brave_debullshitinator-policies.json /etc/brave/policies/managed
yay -Sy --noconfirm --needed brave-bin

#mega
wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst && sudo pacman -U "$PWD/megasync-x86_64.pkg.tar.zst"

#caskaydia mono nerd font
sudo pacman -S ttf-cascadia-mono-nerd

#papirus icon theme
sudo pacman -Sy --needed --noconfirm papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

#neovim
sudo pacman -Sy --needed fzf ripgrep fd neovim luarocks tree-sitter-cli

#cli tools
