# brave-browser uninstall
```sh
#https://support.brave.com/hc/en-us/articles/4404876135565-How-do-I-uninstall-Brave
sudo dnf remove -y brave-browser brave-keyring
sudo rm /etc/yum.repos.d/brave-browser-*.repo
sudo rpm -e gpg-pubkey-c2d4e821-5e7252b8
rm -rf ~/.config/BraveSoftware
rm -rf ~/.cache/BraveSoftware
```


# mega install
```sh
cd ~/Downloads/
wget https://mega.nz/linux/repo/Fedora_43/x86_64/megasync-Fedora_43.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_43.x86_64.rpm"
```


# mega uninstall
```sh
#https://help.mega.io/installs-apps/desktop/uninstall
sudo dnf remove -y megasync
sudo rm /etc/yum.repos.d/megasync.repo
#after removing the package, you may want to delete the app’s data folder
rm -r ~/.local/share/data/Mega\ Limited

```

## pdf viewer (customizable & themeable alternative)
```sh
sudo dnf install -y zathura zathura-pdf-poppler
```


# AppImages dependency install
```sh
sudo dnf install -y fuse-libs
```

# integrate AppImages with the system menu
```sh
flatpak install it.mijorus.gearlever #uncomment when using AppImages
```


# gnome apps uninstall
```sh
sudo dnf remove \
  gnome-software \
  ptyxis \
  gnome-contacts \
  gnome-weather \
  gnome-clocks \
  gnome-maps \
  simple-scan \
  totem \
  gnome-connections \
  rhythmbox \
  malcontent-control \
  decibels \
  showtime \
  firefox fedora-bookmarks
```


# copr uninstall
```sh
sudo dnf remove swayosd
sudo dnf copr disable erikreider/swayosd
cd /etc/yum.repos.d
sudo rm _copr:copr.fedorainfracloud.org:erikreider:swayosd.repo
# or, alternately uninstall the package & disable copr repo from gnome-software gui app

```

# install eget - binary manager
```sh
# https://github.com/zyedidia/eget
cd ~/Downloads
wget -q eget.sh https://zyedidia.github.io/eget.sh
chmod u+x eget.sh
# shasum -a 256 eget.sh # verify with hash below
bash eget.sh
./eget zyedidia/eget
mv eget ~/.local/bin
# usage example
# eget marcosnils/bin --to ~/.local/bin/
# update eget
# eget zyedidia/eget --to ~/.local/bin/
```


# vscode install
```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
dnf check-update
sudo dnf install -y code
```


# vscode uninstall
```sh
sudo dnf remove -y code
#remove vs code software repository
#https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/
sudo rm /etc/yum.repos.d/vscode.repo
#remove configs
#https://code.visualstudio.com/docs/setup/uninstall
rm -rf ~/.config/Code
rm -rf ~/.vscode
```


# install evil-helix
```sh
VERSION="20250915"
cd /opt
sudo curl -Lo helix.tar.gz https://github.com/usagi-flow/evil-helix/releases/download/release-${VERSION}/evil-helix-aarch64-linux.tar.gz
sudo tar -xf helix.tar.gz
rm helix.tar.gz
cd /usr/local/bin
sudo ln -sv /opt/helix/hx .
cd ~/Downloads
```
