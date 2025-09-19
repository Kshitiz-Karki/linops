#fedora
#https://support.brave.com/hc/en-us/articles/4404876135565-How-do-I-uninstall-Brave
sudo dnf remove -y brave-browser brave-keyring
sudo rm /etc/yum.repos.d/brave-browser-*.repo
sudo rpm -e gpg-pubkey-c2d4e821-5e7252b8
rm -rf ~/.config/BraveSoftware
rm -rf ~/.cache/BraveSoftware
