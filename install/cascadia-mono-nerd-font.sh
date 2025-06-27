if [ "$ID" == "arch" ]; then
  sudo pacman -Sy --needed ttf-cascadia-mono-nerd
elif [ "$ID" == "fedora" ]; then
  mkdir -p ~/.fonts
  cd ~/Downloads
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
  unzip CascadiaMono.zip -d CascadiaFont
  cp -r CascadiaFont ~/.fonts
  rm -rf CascadiaMono.zip CascadiaFont
  fc-cache -v
  cd -
else
  printf "%b\n" "${YELLOW}No scripts present for ${ID}, exiting ...${RC}"
  exit 1
fi
