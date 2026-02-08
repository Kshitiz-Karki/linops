#!/bin/bash

#Update pacman.conf
sudo cp /etc/pacman.conf /etc/pacman.conf.bak
sudo sed -i 's/^#Color$/Color/' /etc/pacman.conf
sudo sed -i '/^#DisableSandbox/a ILoveCandy' /etc/pacman.conf
sudo pacman -Sy --noconfirm

#Install reflector and updating mirrorlist
sudo pacman -Sy --needed --noconfirm reflector
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy --noconfirm

#yay
sudo pacman -S --needed --noconfirm base-devel git
if ! command -v yay &>/dev/null; then
  cd ~/Downloads
  rm -rf yay-bin
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  rm -rf ../yay-bin
  cd -
fi

#fwupd
sudo pacman -Sy --needed fwupd
sudo systemctl enable --now fwupd
fwupdmgr get-devices
fwupdmgr refresh
fwupdmgr get-updates
fwupdmgr update
fwupdmgr report-history
#disable passim for security reasons, https://wiki.archlinux.org/title/Fwupd)
sudo systemctl mask passim.service
sudo pacman -Sy --needed gnome-firmware
