if [ "$ID" == "arch" ]; then
  yay -Sy --noconfirm --needed betterbird-bin
elif [ "$ID" == "fedora" ]; then
  flatpak install -y flathub eu.betterbird.Betterbird
else
  printf "%b\n" "${YELLOW}No scripts present for ${ID}, exiting ...${RC}"
  exit 1
fi
