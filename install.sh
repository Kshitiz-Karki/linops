#!/bin/bash

# clear

RC='\033[0m'
YELLOW='\033[33m'
GREEN='\033[32m'
# RED='\033[0;31m'

# Check for sudo
# if [ "$EUID" -ne 0 ]; then
#   printf "%b\n" "${RED}This script must be run with sudo.${RC}"
#   exit 1
# fi

# username="$(logname)" use $HOME instead

# REPO_PATH="$HOME/Documents/linops"

#TODO - setup github projects

printf "%b\n" "${YELLOW}Applying catppuccin mocha (default) theme...${RC}"
# mkdir -p ~/Documents/themes
ln -s $REPO_PATH/themes/catppuccin-mocha ~/.config/themes
ln -s ~/.config/themes/btop.theme ~/.config/btop/themes/current.theme
ln -s ~/.config/themes/dunst ~/.config/dunst/theme
ln -s ~/.config/themes/foot.ini ~/.config/foot/theme.ini
# ln -s ~/.config/themes/kitty.conf ~/.config/kitty/theme.conf
ln -s ~/.config/themes/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
# ln -s ~/.config/themes/zathura ~/.config/zathura/theme

#TODO: configure dotfiles - gnu stow

#after check-repo github repo is cloned, then run below:
#create hardlink - ln original.txt backup.txt
ln -v ~/Documents/github/check-repo/repo_targets.json $REPO_PATH/configs/check-repo.json

# Install the custom package list
printf "%b\n" "${YELLOW}Installing packages...${RC}"

. /etc/os-release

if [ "$ID" == "arch" ]; then
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm --needed --disable-download-timeout $(<packages/arch.txt)
elif [ "$ID" == "fedora" ]; then
  sudo dnf update -y
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  # sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
  source "$REPO_PATH/packages/fedora.sh"
fi

#flatpaks
flatpak install flathub md.obsidian.Obsidian
# flatpak install flathub com.saivert.pwvucontrol
flatpak install flathub org.gnome.DejaDup

#github repos
mkdir -p ~/Documents/github
cd ~/Documents/github
# ..... to be added

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
# gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
# gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

#https://linuxconfig.org/how-to-set-battery-charge-thresholds-on-linux
echo 40 | sudo tee /sys/class/power_supply/BAT0/charge_start_threshold
echo 50 | sudo tee /sys/class/power_supply/BAT0/charge_stop_threshold

printf "%b\n" "${YELLOW}Setting up utilities...${RC}"
# [ ! -d ~/bin ] && mkdir ~/bin
# for file in $REPO_PATH/utils/*; do sudo cp $file ~/bin; done
ln -s $REPO_PATH/utils ~/bin

printf "%b\n" "${GREEN}Installation complete.${RC}"
