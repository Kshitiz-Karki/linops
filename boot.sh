#!/bin/bash

clear

. /etc/os-release

echo "\nCloning linops"
rm -rf ~/Downloads/linops
git clone --depth 1 "https://github.com/Kshitiz-Karki/linops.git" ~/Downloads/linops >/dev/null

if [ "$ID" == "arch" ]; then
  source ~/Downloads/linops/install/arch/packages.sh
elif [ "$ID" == "fedora" ]; then
  source ~/Downloads/linops/install/fedora/packages.sh
fi

echo 'Done !!!!!!!'
