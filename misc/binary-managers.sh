# install eget
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

# install bin
# https://github.com/marcosnils/bin
cd ~/Downloads
wget -qO bin https://github.com/marcosnils/bin/releases/download/v0.26.0/bin_0.26.0_linux_amd64
chmod u+x bin
./bin install github.com/marcosnils/bin
# usage example
# https://github.com/marcosnils/bin#-commands-reference
