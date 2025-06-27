#https://flathub.org/apps/com.ktechpit.colorwall
flatpak install -y flathub com.ktechpit.colorwall

flatpak uninstall -y --delete-data flathub com.ktechpit.colorwall
flatpak uninstall --unused
