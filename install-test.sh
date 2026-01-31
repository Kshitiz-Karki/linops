#!/bin/bash

clear

RC='\033[0m'
YELLOW='\033[33m'
GREEN='\033[32m'
RED='\033[0;31m'

# Check for sudo
if [ "$EUID" -ne 0 ]; then
  printf "%b\n" "${RED}This script must be run with sudo.${RC}"
  exit 1
fi

username="$(logname)"

# Install the custom package list
printf "%b\n" "${YELLOW}Installing packages...${RC}"

. /etc/os-release

if [ "$ID" == "arch" ]; then
  pacman -Syu --noconfirm
  pacman -S --noconfirm --needed --disable-download-timeout $(<packages-arch.txt)
elif [ "$ID" == "fedora" ]; then
  #initial setup
  # sudo dnf update -y
  # sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  # sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
  # source ~/Documents/sway-setup/fedora/packages.sh
  dnf install $(<arch/packages.txt)
fi
# Deploy user configs
printf "%b\n" "${YELLOW}Deploying configs...${RC}"

printf "%b\n" "${GREEN}Installation complete.${RC}"
