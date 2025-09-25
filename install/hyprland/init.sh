#!/bin/bash

# if [[ ":$PATH:" == *":$HOME/.local/share/omarchy:"* || ":$PATH:" == *":~/.local/share/omarchy:"* ]]; then
#   echo '~/.local/share/omarchy is in PATH'
# else
export OMARCHY_PATH="$HOME/.local/share/omarchy"
export PATH="$OMARCHY_PATH:$PATH"
# echo 'export PATH=~/.local/share/omarchy:$PATH' >>~/.zshrc
# echo 'export PATH=~/.local/share/omarchy:$PATH' >>~/.bashrc
# fi

mkdir -p ~/.local/share/omarchy/
cp -r ~/Documents/code/linops/install/omarchy/bin ~/.local/share/omarchy/

source ~/Documents/code/linops/install/hyprland/packages.sh

# Copy over Omarchy configs
cp -r ~/Documents/code/linops/install/omarchy/config/* ~/.config/
# Use default bashrc from Omarchy
[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.bashrc-default.bak
cp ~/Documents/code/linops/install/omarchy/default/bashrc ~/.bashrc

#configure theme
# gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
source ~/Documents/code/linops/install/hyprland/theme.sh

# Open video files with mpv
xdg-mime default mpv.desktop video/mp4
xdg-mime default mpv.desktop video/x-msvideo
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/x-flv
xdg-mime default mpv.desktop video/x-ms-wmv
xdg-mime default mpv.desktop video/mpeg
xdg-mime default mpv.desktop video/ogg
xdg-mime default mpv.desktop video/webm
xdg-mime default mpv.desktop video/quicktime
xdg-mime default mpv.desktop video/3gpp
xdg-mime default mpv.desktop video/3gpp2
xdg-mime default mpv.desktop video/x-ms-asf
xdg-mime default mpv.desktop video/x-ogm+ogg
xdg-mime default mpv.desktop video/x-theora+ogg
xdg-mime default mpv.desktop application/ogg
