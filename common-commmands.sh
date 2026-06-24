# check running services
systemctl list-units --type=service --state=running

# disable printer service
sudo systemctl disable --now cups
sudo systemctl disable --now cups.service
sudo systemctl disable --now cups.path
sudo systemctl disable --now accounts-daemon.service

screenshot region ~/Documents/obsidian/images gzk-blp-30
aria2c -s 10 -x 10 'https://...'
