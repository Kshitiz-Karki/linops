flatpak install -y flathub md.obsidian.Obsidian

flatpak uninstall -y --delete-data flathub md.obsidian.Obsidian
flatpak uninstall --unused

sudo pacman -S --needed obsidian
sudo pacman -Rns obsidian
