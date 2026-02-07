#!/bin/bash

clear

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

# Install the custom package list
printf "%b\n" "${YELLOW}Installing packages...${RC}"

. /etc/os-release

if [ "$ID" == "arch" ]; then
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm --needed --disable-download-timeout $(<arch/packages.txt)
elif [ "$ID" == "fedora" ]; then
  sudo dnf update -y
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  # sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
  source ~/Documents/sway-setup/fedora/packages.sh
fi

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

#https://linuxconfig.org/how-to-set-battery-charge-thresholds-on-linux
echo 40 | sudo tee /sys/class/power_supply/BAT0/charge_start_threshold
echo 50 | sudo tee /sys/class/power_supply/BAT0/charge_stop_threshold

printf "%b\n" "${YELLOW}Setting up utilities...${RC}"
# [ ! -d ~/bin ] && mkdir ~/bin
# for file in ~/Documents/code/configurator/utilities/*; do sudo cp $file ~/bin; done
ln -s ~/Documents/linops/utils ~/bin

printf "%b\n" "${YELLOW}Deploying configs...${RC}"
ln -snf ~/Documents/linops/configs/foot ~/.config/foot
ln -snf ~/Documents/linops/configs/dunst ~/.config/dunst
ln -snf ~/Documents/linops/configs/btop ~/.config/btop
ln -snf ~/Documents/linops/configs/eza ~/.config/eza
ln -snf ~/Documents/linops/configs/kitty ~/.config/kitty
ln -snf ~/Documents/linops/configs/nvim ~/.config/nvim
ln -snf ~/Documents/linops/configs/zoxide ~/.config/zoxide
ln -snf ~/Documents/linops/configs/zsh ~/.config/zsh
ln -snf ~/Documents/linops/configs/starship.toml ~/.config
mv ~/.bashrc ~/.bashrc.bkp
ln -snf ~/Documents/linops/configs/.bashrc ~/
ln -snf ~/Documents/linops/configs/.zshrc ~/

if [[ ":$PATH:" == *":$HOME/bin:"* || ":$PATH:" == *":~/bin:"* ]]; then
  echo '~/bin is in PATH'
else
  echo 'export PATH=~/bin:$PATH' >>~/.zshrc
  echo 'export PATH=~/bin:$PATH' >>~/.bashrc
fi

printf "%b\n" "${YELLOW}Applying catppuccin mocha (default) theme...${RC}"
# mkdir -p ~/Documents/themes
ln -s ~/Documents/linops/themes/catppuccin-mocha ~/.config/themes
ln -s ~/.config/themes/zathura ~/.config/zathura/theme
ln -s ~/.config/themes/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
ln -s ~/.config/themes/kitty.conf ~/.config/kitty/theme.conf
ln -s ~/.config/themes/btop.theme ~/.config/btop/themes/current.theme
ln -s ~/.config/themes/dunst ~/.config/dunst/theme
ln -s ~/.config/themes/foot.ini ~/.config/foot/theme.ini

printf "%b\n" "${GREEN}Installation complete.${RC}"
