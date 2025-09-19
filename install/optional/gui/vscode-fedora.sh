#!/bin/bash
#install
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
dnf check-update
sudo dnf install -y code
#uninstall
sudo dnf remove -y code
#remove vs code software repository
#https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/
sudo rm /etc/yum.repos.d/vscode.repo
#remove configs
#https://code.visualstudio.com/docs/setup/uninstall
rm -rf ~/.config/Code
rm -rf ~/.vscode
