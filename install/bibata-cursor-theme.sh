cd ~/Downloads
rm -rf GTK-themes-icons
git clone https://github.com/JaKooLit/GTK-themes-icons.git --depth 1
mkdir -p ~/.icons
rm -rf ~/.icons/Bibata-Modern-Ice
unzip -o -q "GTK-themes-icons/icon/Bibata-Modern-Ice.zip" -d ~/.icons/
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice
rm -rf GTK-themes-icons
cd -
