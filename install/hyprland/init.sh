#!/bin/bash

if [[ ":$PATH:" == *":$HOME/bin/omarchy:"* || ":$PATH:" == *":~/bin/omarchy:"* ]]; then
  echo '~/bin/omarchy is in PATH'
else
  export OMARCHY_PATH="$HOME/bin/omarchy"
  export PATH="$OMARCHY_PATH:$PATH"
fi

for file in ~/Documents/code/linops/install/hyprland/bin/*; do sudo cp $file ~/bin/omarchy/; done

source ~/Documents/code/linops/install/hyprland/packages.sh

# omarchy-webapp-install "WhatsApp" https://web.whatsapp.com/ WhatsApp.png
# omarchy-webapp-install "ChatGPT" https://chatgpt.com/ ChatGPT.png
# omarchy-webapp-install "YouTube" https://youtube.com/ YouTube.png
# omarchy-webapp-install "GitHub" https://github.com/ GitHub.png

# Copy over Omarchy configs
mkdir -p ~/.config
cp -R ~/Documents/code/linops/install/hyprland/configs/* ~/.config/
# Use default bashrc from Omarchy
[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.bashrc-default.bak
cp ~/.local/share/omarchy/default/bashrc ~/.bashrc

#configure theme
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
