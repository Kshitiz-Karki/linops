#!/bin/bash

#brave browser
# add debloat scripts for brave, https://github.com/MulesGaming/brave-debloatinator
sudo mkdir /etc/brave/policies/managed -p
cat <<EOF >/etc/brave/policies/managed/brave_debullshitinator-policies.json
{
  "BraveRewardsDisabled": true,
  "BraveWalletDisabled": true,
  "BraveVPNDisabled": 1,
  "BraveAIChatEnabled": false,
  "TorDisabled": true,
  "PasswordManagerEnabled": false
}
EOF
dnf install dnf-plugins-core
dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf install brave-browser

#mega
# cd ~/Downloads/
# wget https://mega.nz/linux/repo/Fedora_43/x86_64/megasync-Fedora_43.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_43.x86_64.rpm"

dnf install zathura zathura-pdf-poppler

#vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
dnf check-update
sudo dnf install -y code
