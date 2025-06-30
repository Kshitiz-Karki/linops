sudo pacman -Sy --needed --noconfirm flatpak git curl wget
bash -c "$(curl -s https://raw.githubusercontent.com/mylinuxforwork/dotfiles-installer/master/setup.sh)"
flatpak run com.ml4w.dotfilesinstaller
