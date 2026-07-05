#!/bin/bash

#brave-browser uninstall
#https://support.brave.com/hc/en-us/articles/4404876135565-How-do-I-uninstall-Brave
sudo dnf remove -y brave-browser brave-keyring
sudo rm /etc/yum.repos.d/brave-browser-*.repo
sudo rpm -e gpg-pubkey-c2d4e821-5e7252b8
rm -rf ~/.config/BraveSoftware
rm -rf ~/.cache/BraveSoftware

#mega install
cd ~/Downloads/
wget https://mega.nz/linux/repo/Fedora_43/x86_64/megasync-Fedora_43.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_43.x86_64.rpm"

#mega uninstall
#https://help.mega.io/installs-apps/desktop/uninstall
sudo dnf remove -y megasync
sudo rm /etc/yum.repos.d/megasync.repo
#after removing the package, you may want to delete the app’s data folder
rm -r ~/.local/share/data/Mega\ Limited

# pdf viewer (customizable & themeable alternative)
sudo dnf install -y zathura zathura-pdf-poppler

# AppImages dependency install
sudo dnf install -y fuse-libs
# integrate AppImages with the system menu
flatpak install it.mijorus.gearlever #uncomment when using AppImages

#gnome apps uninstall
sudo dnf remove \
  gnome-software \
  ptyxis \
  gnome-contacts \
  gnome-weather \
  gnome-clocks \
  gnome-maps \
  simple-scan \
  totem \
  gnome-connections \
  rhythmbox \
  malcontent-control \
  decibels \
  showtime \
  firefox fedora-bookmarks

#copr uninstall
sudo dnf remove swayosd
sudo dnf copr disable erikreider/swayosd
cd /etc/yum.repos.d
sudo rm _copr:copr.fedorainfracloud.org:erikreider:swayosd.repo
# or, alternately uninstall the package & disable copr repo from gnome-software gui app
