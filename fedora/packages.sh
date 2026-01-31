#!/bin/bash

#caskaydia mono nerd font
dnf install cascadia-mono-nf-fonts
# mkdir -p ~/.local/share/fonts
# mkdir -p ~/Documents/github
# cd ~/Documents/github
# wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
# unzip CascadiaMono.zip -d CascadiaFont
# cp -r CascadiaFont ~/.local/share/fonts
# fc-cache
# rm -rf CascadiaFont
# cd -

#rest
sudo dnf copr enable alternateved/eza
sudo dnf install -y eza

sudo dnf copr enable atim/starship
sudo dnf install -y starship

dnf install -y \
  papirus-icon-theme \
  fzf ripgrep fd neovim luarocks tree-sitter-cli \
  bat \
  btop \
  tldr \
  trash-cli \
  zoxide \
  zsh \
  rofi \
  aria2c \
  wlsunset grimshot \
  evince

# stow # mpv # kitty alacritty # wiremix # pamixer # fastfetch

dnf remove pavucontrol

flatpak install md.obsidian.Obsidian com.saivert.pwvucontrol
