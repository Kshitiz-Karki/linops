# check running services
```sh
systemctl list-units --type=service --state=running
```

# disable printer service
```sh
sudo systemctl disable --now cups
sudo systemctl disable --now cups.service
sudo systemctl disable --now cups.path
sudo systemctl disable --now accounts-daemon.service
```

# screenshot (./utils/screenshot)
```sh
screenshot region <save-location> <filename>
screenshot region ~/Documents/obsidian/images gzk-blp-30
```

# download
```sh
aria2c -s 10 -x 10 'https://...'
```
