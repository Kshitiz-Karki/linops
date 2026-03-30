# check running services
systemctl list-units --type=service --state=running

# disable printer service
sudo systemctl disable --now cups
sudo systemctl disable --now accounts-daemon.service
