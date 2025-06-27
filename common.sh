set -e

printf "%b\n" "${YELLOW}Installing brave browser ...${RC}"
# source ~/Downloads/configurator/install/brave-browser.sh

printf "%b\n" "${YELLOW}Installing mega app ...${RC}"
# source ~/Downloads/configurator/install/mega.sh

printf "%b\n" "${YELLOW}Installing bibata modern ice cursor theme ...${RC}"
# source ~/Downloads/configurator/install/bibata-cursor-theme.sh

printf "%b\n" "${YELLOW}Installing Papirus icon theme ...${RC}"
source ~/Downloads/configurator/install/papirus-icon-theme.sh

printf "%b\n" "${YELLOW}Installing cascadia mono nerd font ...${RC}"
source ~/Downloads/configurator/install/cascadia-mono-nerd-font.sh

printf "%b\n" "${YELLOW}Installing betterbird (flatpak) ...${RC}"
# flatpak install -y flathub eu.betterbird.Betterbird

# printf "%b\n" "${YELLOW}Installing gum ...${RC}"
# source ~/Downloads/configurator/install/gum.sh

# printf "%b\n" "${YELLOW}Setting up git ...${RC}"
# source ~/Downloads/configurator/configure/setup-git.sh
#
# gum input --prompt "Added SSH key to github?" --value " yes"

printf "%b\n" "${YELLOW}Configuring and setting dotfiles ...${RC}"
rm -rf ~/dotfiles
git clone --depth 1 https://github.com/Kshitiz-Karki/dotfiles.git ~/dotfiles >/dev/null

[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak

# Get the path to zsh
ZSH_PATH=$(command -v zsh)
if [[ -z "$ZSH_PATH" ]]; then
  printf "%b\n" "${YELLOW}Zsh installation failed or zsh not found.${RC}"
  exit 1
fi
# Set zsh as the default shell for the current user
sudo chsh -s "$ZSH_PATH" "$USER"

cd ~/dotfiles
for dir in $HOME/dotfiles/*; do
  if [ -d "$dir" ]; then
    stow "$(basename $dir)"
  fi
done
cd -

printf "%b\n" "${YELLOW}Setting up utilities ...${RC}"
[ ! -d ~/bin ] && mkdir ~/bin
for file in ~/Downloads/configurator/utilities/*; do sudo cp $file ~/bin; done

if [[ ":$PATH:" == *":$HOME/bin:"* || ":$PATH:" == *":~/bin:"* ]]; then
  printf "%b\n" "${YELLOW}~/bin is in PATH${RC}"
else
  echo 'export PATH=~/bin:$PATH' >>~/.zshrc
  echo 'export PATH=~/bin:$PATH' >>~/.bashrc
fi

printf "%b\n" "${YELLOW}Change battery charging start and stop thresholds ...${RC}"
source ~/Downloads/configurator/configure/charging-thresholds.sh

if [ $XDG_CURRENT_DESKTOP == "GNOME" ]; then
  printf "%b\n" "${YELLOW}Configuring keybindings ...${RC}"
  source ~/Downloads/configurator/configure/gnome-keybindings.sh
  printf "%b\n" "${YELLOW}Remove unrequired gnome apps ...${RC}"
  source ~/Downloads/configurator/uninstall/default-gnome-apps.sh
fi
