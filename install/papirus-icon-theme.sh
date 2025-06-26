if [ "$ID" == "arch" ]; then
  sudo pacman -Sy --needed papirus-icon-theme
  gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
elif [ "$ID" == "fedora" ]; then
  sudo dnf install -y papirus-icon-theme
  gsettings set org.gnome.desktop.interface icon-theme 'papirus-icon-theme-dark'
else
  printf "%b\n" "${YELLOW}No scipts present for ${ID}, exiting ...${RC}"
  exit 1
fi
