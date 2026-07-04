#!/bin/bash

#post install scripts - start
# guide - https://techhut.tv/fedora-44-post-install-guide
# youtube - https://www.youtube.com/watch?v=Zu8A3_NflvA
# sudo tee -a /etc/dnf/dnf.conf >/dev/null <<'EOF'
# fastestmirror=True
# max_parallel_downloads=4
# EOF

sudo dnf update -y
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
sudo dnf group upgrade -y multimedia
sudo dnf group upgrade -y core

# sudo dnf install -y fwupd
# fwupdmgr refresh --force
# fwupdmgr get-devices
# fwupdmgr get-updates
# fwupdmgr update

#post install scripts - end

# nerd fonts installer & updater (use a custom bash script instead??)
# https://github.com/getnf/getnf
# curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
# getnf -i CascadiaMono

#caskaydia mono nerd font
# mkdir -p ~/.local/share/fonts
# mkdir -p ~/Documents/github
# cd ~/Documents/github
# wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
# unzip CascadiaMono.zip -d CascadiaFont
# cp -r CascadiaFont ~/.local/share/fonts
# fc-cache
# rm -rf CascadiaFont CascadiaMono.zip
# cd -

# system, wayland, desktop/window manager packages
sudo dnf install -y \
  curl wget \
  fwupd \
  flatpak \
  papirus-icon-theme \
  wlsunset \
  jetbrains-mono-fonts \
  grimshot grim slurp
# wiremix \
# pamixer

# cli apps/packages or dev tools
sudo dnf copr enable -y atim/starship
# sudo dnf copr enable -y lilay/topgrade
# sudo dnf copr enable -y jdxcode/mise
sudo dnf install -y \
  starship \
  \
  eza \
  fzf ripgrep fd neovim luarocks tree-sitter-cli \
  bat \
  btop \
  tldr \
  trash-cli \
  zoxide \
  zsh \
  rofi \
  tmux # topgrade \
# mise \
# gh
# aria2c
# cliphist

# gui apps
# sudo dnf copr enable lionheartp/Hyprland # waypaper
sudo dnf install -y \
  imv
# chromium-browser
# waypaper
#brave browser
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
# sudo dnf install -y brave-browser
sudo dnf install -y brave-origin
# zed editor
curl -f https://zed.dev/install.sh | sh

# install terra respository
sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf install -y anki

# install nwg-look
# 1. copr - https://copr.fedorainfracloud.org/coprs/tofik/nwg-shell/
# 2. terra - sudo dnf install nwg-look

#enable flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#disable fedora flatpak, use flathib instead
flatpak remote-modify fedora --disable

#install flatpaks
# flatpak install flathub md.obsidian.Obsidian
# com.github.tchx84.Flatseal \
# org.gnome.DejaDup \
# com.saivert.pwvucontrol
