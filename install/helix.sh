set -e

cd /opt
sudo curl -Lo helix.tar.gz https://github.com/usagi-flow/evil-helix/releases/download/release-20250601/evil-helix-amd64-linux.tar.gz
sudo tar -xf helix.tar.gz
rm helix.tar.gz
cd /usr/local/bin
sudo ln -sv /opt/helix/hx .
cd -
