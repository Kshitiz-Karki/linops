set -e

printf "%b\n" "${YELLOW}Enabling bluetooth ...${RC}"
sudo systemctl enable --now bluetooth

printf "%b\n" "${YELLOW}Installing terminal apps and packages ...${RC}"
sudo pacman -Sy --needed aria2 stow bat zoxide tldr trash-cli \
  fzf ripgrep fd kitty zsh eza starship wl-clipboard \
  neovim luarocks tree-sitter-cli \
  yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick btop htop \
  man less

printf "%b\n" "${YELLOW}Installing yay ...${RC}"
sudo pacman -S --needed --noconfirm base-devel git
if ! command -v yay &>/dev/null; then
  cd ~/Downloads
  rm -rf yay-bin
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  rm -rf ../yay-bin
  cd -
fi
