man pacman

# update system
sudo pacman -Syu / yay
# remove package and its configs/data
sudo pacman -Rns <package-name>
# search for a package in pacman with a partial name of 'spotify'
sudo pacman -Ss spotify
# check if a package is installed
sudo pacman -Qs spotify-launcher
# see installed package details
sudo pacman -Qi spotify-launcher

# yay
# install an aur package
yay <package-name>

# search for a package in aur with a partial name of 'spotify'
yay -Ss spotify

