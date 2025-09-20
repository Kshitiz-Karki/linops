#!/bin/bash

#setting up utilities
[ ! -d ~/bin ] && mkdir ~/bin
for file in ~/Documents/code/configurator/utilities/*; do sudo cp $file ~/bin; done

if [[ ":$PATH:" == *":$HOME/bin:"* || ":$PATH:" == *":~/bin:"* ]]; then
  echo '~/bin is in PATH'
else
  echo 'export PATH=~/bin:$PATH' >>~/.zshrc
  echo 'export PATH=~/bin:$PATH' >>~/.bashrc
fi
