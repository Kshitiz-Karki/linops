#!/bin/bash

#initial setup
sudo dnf update -y
#https://tuxdigital.com/videos/9-things-to-do-after-installing-fedora-42-post-setup-guide/
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# sudo dnf install libavcodec-freeworld
#backup
sudo dnf install timeshift -y
