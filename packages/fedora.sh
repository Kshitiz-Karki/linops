#!/bin/bash

#caskaydia mono nerd font
mkdir -p ~/.local/share/fonts
mkdir -p ~/Documents/github
cd ~/Documents/github
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp -r CascadiaFont ~/.local/share/fonts
fc-cache
rm -rf CascadiaFont CascadiaMono.zip
cd -

#rest
sudo dnf copr enable alternateved/eza
# sudo dnf install -y eza

sudo dnf copr enable atim/starship
# sudo dnf install -y starship

sudo dnf install -y \
  eza \
  starship \
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
  evince \
  loupe
# power-profiles-daemon \

# stow # mpv # kitty alacritty # wiremix # pamixer # fastfetch

# sudo dnf remove pavucontrol cups system-config-printer

flatpak install flathub md.obsidian.Obsidian com.saivert.pwvucontrol
