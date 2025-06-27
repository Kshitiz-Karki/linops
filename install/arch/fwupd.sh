sudo pacman -Sy --needed fwupd
sudo systemctl enable --now fwupd

fwupdmgr get-devices
fwupdmgr refresh
fwupdmgr get-updates
fwupdmgr update
fwupdmgr report-history
#disable passim for security reasons, https://wiki.archlinux.org/title/Fwupd)
sudo systemctl mask passim.service
sudo pacman -Sy --needed gnome-firmware
