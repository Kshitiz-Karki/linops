#check running service daemons: (https://www.baeldung.com/linux/list-running-daemons)
systemctl list-units --type=service --state=running

#copy and paste in and out of a Gnome Boxes
#install this in guest os
sudo pacman -Sy --needed spice-vdagent

# connect to internet via terminal
ip addr show
iwctl station '<interface>' get-networks
iwctl --passphrase NetworkName '<passphrase>' station '<interface>' connect

# launch TUI for arch installation
archinstall
