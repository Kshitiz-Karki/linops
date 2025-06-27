#install
sudo pacman -Sy --needed spotify-launcher
flatpak install -y flathub com.spotify.Client

#uninstall
sudo pacman -Rns spotify-launcher
flatpak uninstall -y --delete-data flathub com.spotify.Client
flatpak uninstall --unused
