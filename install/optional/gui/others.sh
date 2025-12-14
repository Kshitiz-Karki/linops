#chromium
sudo dnf install -y chromium
sudo dnf remove -y chromium
sudo pacman -S --needed chromium
sudo pacman -Rns chromium

#discord
sudo dnf install -y discord
sudo dnf remove -y discord
sudo pacman -S --needed discord
sudo pacman -Rns discord

#gnome-tweaks
sudo pacman -S --needed gnome-tweaks
sudo dnf install -y gnome-tweaks
sudo pacman -Rns gnome-tweaks
sudo dnf remove -y gnome-tweaks

#libreoffice
sudo pacman -Sy --needed libreoffice-still
sudo pacman -Rns libreoffice-still

#obsidian
sudo pacman -S --needed obsidian
sudo pacman -Rns obsidian

#spotify
sudo pacman -Sy --needed spotify-launcher
sudo pacman -Rns spotify-launcher

#vscode
sudo pacman -S --needed code
sudo pacman -Rns code

#proton vpn fedora - install
wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm"
sudo dnf install ./protonvpn-stable-release-1.0.3-1.noarch.rpm && sudo dnf check-update --refresh
sudo dnf install proton-vpn-gnome-desktop

#proton vpn fedora - uninstall
sudo dnf remove proton-vpn-gnome-desktop protonvpn-stable-release
