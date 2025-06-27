#install
flatpak install -y flathub com.mattjakeman.ExtensionManager

#uninstall
flatpak uninstall -y --delete-data flathub com.mattjakeman.ExtensionManager
flatpak uninstall --unused
