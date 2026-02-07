#!/bin/bash

#brave
#https://support.brave.com/hc/en-us/articles/4404876135565-How-do-I-uninstall-Brave
sudo dnf remove -y brave-browser brave-keyring
sudo rm /etc/yum.repos.d/brave-browser-*.repo
sudo rpm -e gpg-pubkey-c2d4e821-5e7252b8
rm -rf ~/.config/BraveSoftware
rm -rf ~/.cache/BraveSoftware

#mega
#https://help.mega.io/installs-apps/desktop/uninstall
#arch
sudo pacman -Rns megasync
#fedora
sudo dnf remove -y megasync
sudo rm /etc/yum.repos.d/megasync.repo
#after removing the package, you may want to delete the app’s data folder
rm -r ~/.local/share/data/Mega\ Limited

#vscode
sudo dnf remove -y code
#remove vs code software repository
#https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/
sudo rm /etc/yum.repos.d/vscode.repo
#remove configs
#https://code.visualstudio.com/docs/setup/uninstall
rm -rf ~/.config/Code
rm -rf ~/.vscode
