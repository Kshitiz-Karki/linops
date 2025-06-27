set -e

# configure dnf
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf

printf "%b\n" "${YELLOW}Running dnf update ...${RC}"
sudo dnf update -y

#install homebrew using webinstall.dev, https://webinstall.dev/brew/
curl -sS https://webi.sh/brew | sh
source ~/.config/envman/PATH.env
brew update
brew upgrade
brew install eza
brew install yazi
brew install starship

sudo dnf install -y stow bat zoxide tldr trash-cli fzf ripgrep fd kitty zsh btop htop
# install neovim
sudo dnf install -y neovim luarocks tree-sitter-cli
