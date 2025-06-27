#https://distrobox.it/
#https://fedoramagazine.org/run-distrobox-on-fedora-linux/
sudo pacman -S --needed distrobox
sudo dnf install -y distrobox

distrobox-create --name archlinux --image archlinux:latest --yes
distrobox-enter --name archlinux
distrobox-stop archlinux

# run a command inside distrobox from host OS
distrobox-enter --name archlinux -- sudo pacman -Syu

# export an app from guest to host OS
distrobox-export --app spotify-launcher
