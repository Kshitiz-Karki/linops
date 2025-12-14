#!/bin/bash

#https://www.youtube.com/watch?v=odgD_RdJjCU
#https://kskroyal.com/10-things-to-do-after-installing-arch-linux-2023/
sudo pacman -Syu --noconfirm

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

sudo pacman -S timeshift

sudo systemctl enable --now bluetooth

sudo pacman -Sy --needed --noconfirm git

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
