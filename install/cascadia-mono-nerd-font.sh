# if [ "$ID" == "arch" ]; then
#   sudo pacman -Sy --needed --noconfirm ttf-cascadia-mono-nerd
# elif [ "$ID" == "fedora" ]; then
#   mkdir -p ~/.fonts
#   cd ~/Downloads
#   wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
#   unzip CascadiaMono.zip -d CascadiaFont
#   cp -r CascadiaFont ~/.fonts
#   rm -rf CascadiaMono.zip CascadiaFont
#   fc-cache -v
#   cd -
# else
#   printf "%b\n" "${YELLOW}No scripts present for ${ID}, exiting ...${RC}"
#   exit 1
# fi

mkdir -p ~/.local/share/fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/CaskaydiaMonoNerdFont-Regular.ttf ~/.local/share/fonts
cp CascadiaFont/CaskaydiaMonoNerdFont-Bold.ttf ~/.local/share/fonts
cp CascadiaFont/CaskaydiaMonoNerdFont-Italic.ttf ~/.local/share/fonts
cp CascadiaFont/CaskaydiaMonoNerdFont-BoldItalic.ttf ~/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFont
fc-cache
cd -
