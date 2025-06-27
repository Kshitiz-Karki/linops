set -e

printf "%b\n" "${YELLOW}Running pacman -Syu ...${RC}"
sudo pacman -Syu

printf "%b\n" "${YELLOW}Enabling bluetooth ...${RC}"
sudo systemctl enable --now bluetooth

printf "%b\n" "${YELLOW}Installing terminal apps and packages ...${RC}"
sudo pacman -Sy --needed aria2 stow bat zoxide tldr trash-cli fzf ripgrep fd kitty zsh eza starship wl-clipboard neovim luarocks tree-sitter-cli yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick btop htop

# printf "%b\n" "${YELLOW}Installing yay ...${RC}"
# sudo pacman -Sy --needed base-devel git
# cd ~/Downloads
# rm -rf yay
# git clone https://aur.archlinux.org/yay.git
# cd yay/
# makepkg -si --noconfirm
# cd -
