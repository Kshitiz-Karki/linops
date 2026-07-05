#!/bin/bash

sudo dnf install -y zstd tar
VERSION=$(gh release view --repo ankitects/anki --json tagName --jq '.tagName | ltrimstr("v")')
cd ~/Downloads
wget -q "https://github.com/ankitects/anki/releases/download/${VERSION}/anki-${VERSION}-linux-x86_64.tar.zst"
tar xaf anki-${VERSION}-linux-x86_64.tar.zst
cd anki-linux
sudo ./install.sh
