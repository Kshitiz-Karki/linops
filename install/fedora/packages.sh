#!/bin/bash

#install packages and setup
cd ~/Downloads/

#packages

#brave browser
# add debloat scripts for brave, https://github.com/MulesGaming/brave-debloatinator
sudo mkdir /etc/brave/policies/managed -p
sudo cp ~/Downloads/configurator/configs/brave_debullshitinator-policies.json /etc/brave/policies/managed
sudo dnf install dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo dnf install brave-browser

#mega
wget https://mega.nz/linux/repo/Fedora_42/x86_64/megasync-Fedora_42.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_42.x86_64.rpm"

#caskaydia mono nerd font
mkdir -p ~/.local/share/fonts
mkdir -p ~/Documents/github
cd ~/Documents/github
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp -r CascadiaFont ~/.local/share/fonts
fc-cache
rm -rf CascadiaFont
cd -

#papirus icon theme
sudo dnf install -y papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

#neovim
sudo dnf install -y fzf ripgrep fd neovim luarocks tree-sitter-cli

#cli tools
sudo dnf copr enable alternateved/eza
sudo dnf install -y eza
sudo dnf copr enable atim/starship
sudo dnf install -y starship

sudo dnf install -y stow bat zoxide tldr trash-cli kitty zsh btop

#gui apps
sudo dnf install -y mpv
