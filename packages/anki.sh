#!/bin/bash

# kept as a separate file because same steps needs to be followed for updating anki
# and used by topgrade

AVAILABLE_VERSION=$(gh release view --repo ankitects/anki --json tagName --jq '.tagName | ltrimstr("v")')

# if anki is already installed and is of latest version then do nothing
if command -v anki >/dev/null; then
  ANKI_VERSION=$(anki -v)
  INSTALLED_VERSION=$(printf '%s\n' "$ANKI_VERSION" | awk 'NR==2 {print $2}')
  echo "INSTALLED_VERSION = ${INSTALLED_VERSION}"
  echo "AVAILABLE_VERSION = ${AVAILABLE_VERSION}"
  if [[ "$INSTALLED_VERSION" == "$AVAILABLE_VERSION" ]]; then
    exit 0
  fi
fi

cd ~/Downloads
wget -q "https://github.com/ankitects/anki/releases/download/${AVAILABLE_VERSION}/anki-${AVAILABLE_VERSION}-linux-x86_64.tar.zst"
tar xaf anki-${AVAILABLE_VERSION}-linux-x86_64.tar.zst
cd anki-linux
sudo ./install.sh
rm -rf anki*
cd -
