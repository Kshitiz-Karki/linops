#https://help.mega.io/installs-apps/desktop/uninstall

#arch
sudo pacman -Rns megasync

#fedora
sudo dnf remove -y megasync
sudo rm /etc/yum.repos.d/megasync.repo

#after removing the package, you may want to delete the app’s data folder
rm -r ~/.local/share/data/Mega\ Limited
