#!/bin/bash

# dependencies to compile, run & test .c files
sudo dnf install -y libasan \
  valgrind

#vscode install
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
dnf check-update
sudo dnf install -y code

#vscode uninstall
sudo dnf remove -y code
#remove vs code software repository
#https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/
sudo rm /etc/yum.repos.d/vscode.repo
#remove configs
#https://code.visualstudio.com/docs/setup/uninstall
rm -rf ~/.config/Code
rm -rf ~/.vscode

#install evil-helix
VERSION="20250915"
cd /opt
sudo curl -Lo helix.tar.gz https://github.com/usagi-flow/evil-helix/releases/download/release-${VERSION}/evil-helix-aarch64-linux.tar.gz
sudo tar -xf helix.tar.gz
rm helix.tar.gz
cd /usr/local/bin
sudo ln -sv /opt/helix/hx .
cd ~/Downloads
