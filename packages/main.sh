#!/bin/bash

# *********************FEDORA POST INSTALL SCRIPTS - START*********************
# guide - https://techhut.tv/fedora-44-post-install-guide
# youtube - https://www.youtube.com/watch?v=Zu8A3_NflvA
sudo tee -a /etc/dnf/dnf.conf >/dev/null <<'EOF'
fastestmirror=True
max_parallel_downloads=4
EOF

sudo dnf update -y
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
sudo dnf group upgrade -y multimedia
sudo dnf group upgrade -y core

# install terra respository
# sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# *********************FEDORA POST INSTALL SCRIPTS - END*********************

# *************************SYSTEM PAKAGES*************************
sys_pkgs=(
  fwupd
  flatpak
  papirus-icon-theme
  jetbrains-mono-fonts
  gtklock
  # wiremix
  # pamixer
)
sudo dnf install -y "${sys_pkgs[@]}"
# *************************CLI PAKAGES/DEV TOOLS*************************
sudo dnf copr enable -y atim/starship
sudo dnf copr enable -y lilay/topgrade
# sudo dnf copr enable -y jdxcode/mise
cli_dev_pkgs=(
  starship
  eza
  fzf ripgrep fd neovim luarocks tree-sitter-cli
  bat
  btop
  tldr
  trash-cli
  zoxide
  zsh
  rofi
  tmux
  topgrade
  # mise
  # aria2c
  # cliphist
)
sudo dnf install -y "${cli_dev_pkgs[@]}"
printf "%b\n" "${YELLOW}Install bin - binary manager ...${RC}"
# install bin - binary manager (https://github.com/marcosnils/bin)
# usage example - https://github.com/marcosnils/bin#-commands-reference
cd ~/Downloads
VERSION_BIN=$(gh release view --repo marcosnils/bin --json tagName --jq '.tagName | ltrimstr("v")')
wget -qO bin "https://github.com/marcosnils/bin/releases/download/v${VERSION_BIN}/bin_${VERSION_BIN}_linux_amd64"
chmod u+x bin
./bin install github.com/marcosnils/bin
rm bin
cd -

#install surge - TUI download manager
bin install github.com/SurgeDM/Surge

# nerd fonts installer & updater
# https://github.com/getnf/getnf
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i CascadiaMono

# *****************************GUI PAKAGES*****************************
# sudo dnf copr enable lionheartp/Hyprland # waypaper
# sudo dnf install -y \
# chromium-browser
# waypaper
#brave browser
# sudo dnf install -y dnf-plugins-core
# sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
# sudo dnf install -y brave-browser
# sudo dnf install -y brave-origin
# zed editor
# curl -f https://zed.dev/install.sh | sh
source "${REPO_PATH}/packages/anki.sh"

# install nwg-look
# 1. copr - https://copr.fedorainfracloud.org/coprs/tofik/nwg-shell/
# 2. terra - sudo dnf install nwg-look

#disable fedora flatpak, use flathib instead (fedora flatpak not pre-installed in sway spin)
# if command -v flatpak >/dev/null; then
#   flatpak remote-modify fedora --disable
# fi

#enable flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#install flatpaks
flatpaks=(
  md.obsidian.Obsidian
  com.github.tchx84.Flatseal
  org.gnome.DejaDup
  # com.saivert.pwvucontrol
)

flatpak install --noninteractive flathub "${flatpaks[@]}"
