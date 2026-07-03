#!/bin/bash

#mega
cd ~/Downloads/
wget https://mega.nz/linux/repo/Fedora_43/x86_64/megasync-Fedora_43.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_43.x86_64.rpm"

# pdf viewer (customizable & themeable alternative)
sudo dnf install -y zathura zathura-pdf-poppler

#vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
dnf check-update
sudo dnf install -y code

# required for AppImages
sudo dnf install -y fuse-libs
# integrate AppImages with the system menu
flatpak install it.mijorus.gearlever #uncomment when using AppImages

#install evil-helix
VERSION="20250915"
cd /opt
sudo curl -Lo helix.tar.gz https://github.com/usagi-flow/evil-helix/releases/download/release-${VERSION}/evil-helix-aarch64-linux.tar.gz
sudo tar -xf helix.tar.gz
rm helix.tar.gz
cd /usr/local/bin
sudo ln -sv /opt/helix/hx .
cd ~/Downloads
