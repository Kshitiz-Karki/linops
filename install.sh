#!/bin/bash

set -e

clear

RC='\033[0m'
YELLOW='\033[33m'
GREEN='\033[32m'

export REPO_NAME="linops"
mkdir -p ~/Projects
export REPO_PATH="$HOME/Projects/$REPO_NAME"

rm -rf $REPO_PATH
git clone "https://github.com:Kshitiz-Karki/${REPO_NAME}.git" $REPO_PATH >/dev/null

# Check for sudo
# if [ "$EUID" -ne 0 ]; then
#   printf "%b\n" "${RED}This script must be run with sudo.${RC}"
#   exit 1
# fi

#setup github projects
# mkdir -p ~/Projects/github
# cd ~/Documents/github

printf "%b\n" "${YELLOW}Apply catppuccin mocha (default) theme ...${RC}"
ln -s $REPO_PATH/themes/catppuccin-mocha ~/.config/themes
ln -s ~/.config/themes/btop.theme ~/.config/btop/themes/current.theme
ln -s ~/.config/themes/dunst ~/.config/dunst/theme
ln -s ~/.config/themes/foot.ini ~/.config/foot/theme.ini
# ln -s ~/.config/themes/kitty.conf ~/.config/kitty/theme.conf
ln -s ~/.config/themes/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
ln -s ~/.config/themes/waybar.css ~/.config/waybar/color.css
ln -s ~/.config/themes/gtklock.css ~/.config/gtklock/color.css
# ln -s ~/.config/themes/zathura ~/.config/zathura/theme

printf "%b\n" "${YELLOW}Configure dotfiles using gnu stow ...${RC}"
sudo dnf install -y stow
git clone https://github.com/Kshitiz-Karki/dotfiles.git ~/dotfiles >/dev/null
cd ~/dotfiles
stow .

source ~/.bashrc

printf "%b\n" "${YELLOW}Install packages ...${RC}"
. /etc/os-release
if [ "$ID" == "arch" ]; then
  source "$REPO_PATH/packages/arch.sh"
elif [ "$ID" == "fedora" ]; then
  source "$REPO_PATH/packages/fedora.sh"
fi

printf "%b\n" "${YELLOW}Set zsh as the default shell for the current user ...${RC}"
sudo chsh -s /usr/bin/zsh "$USER"

printf "%b\n" "${YELLOW}Apply papirus icon theme ...${RC}"
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
# gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
# gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
# gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

printf "%b\n" "${YELLOW}Set battery charge thresholds (40 - 80) ...${RC}"
#https://linuxconfig.org/how-to-set-battery-charge-thresholds-on-linux
echo 40 | sudo tee /sys/class/power_supply/BAT0/charge_start_threshold
echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_stop_threshold

printf "%b\n" "${YELLOW}Set up utilities at ~/bin ...${RC}"
ln -s $REPO_PATH/utils ~/bin

printf "%b\n" "${YELLOW}Cleanup (remove unrequired packages) ...${RC}"
sudo dnf group remove -y printing
sudo dnf remove -y \
  cups \
  system-config-printer \
  sddm # use tty login using .bash_profile and .zprofile

printf "%b\n" "${GREEN}Complete.${RC}"
