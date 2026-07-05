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
