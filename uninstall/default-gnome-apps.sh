if [ "$ID" == "arch" ]; then
  sudo pacman -Rns nano gnome-contacts gnome-music totem gnome-connections simple-scan gnome-tweaks gnome-weather
elif [ "$ID" == "fedora" ]; then
  sudo dnf remove -y gnome-contacts rhythmbox gnome-tour libreoffice\* gnome-connections totem gnome-weather simple-scan
  sudo dnf autoremove
else
  printf "%b\n" "${YELLOW}No scripts present for ${ID}, exiting ...${RC}"
  exit 1
fi
