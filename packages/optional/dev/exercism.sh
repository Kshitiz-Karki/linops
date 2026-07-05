#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Error: missing 'version' cli argument" >&2
  echo "Usage: $0 <version>" >&2
  exit 1
fi

VERSION="$1"

cd ~/Documents
[ -d ~/Documents/exercism* ] && rm exercism*

wget https://github.com/exercism/cli/releases/download/v${VERSION}/exercism-${VERSION}-linux-x86_64.tar.gz
tar -xf exercism-${VERSION}-linux-x86_64.tar.gz
mkdir -p ~/.local/bin
ln -sf "$HOME/Documents/exercism-${VERSION}-linux-x86_64/exercism" ~/.local/bin/exercism

mkdir -p ~/.zsh/functions
ln -sf "$HOME/Documents/exercism-${VERSION}-linux-x86_64/shell/exercism_completion.zsh" "$HOME/.zsh/functions/_exercism"
# mv ../shell/exercism_completion.zsh ~/.zsh/functions/_exercism

rm exercism-${VERSION}-linux-x86_64.tar.gz

cd -

exercism configure --token=8121c352-aae9-425d-a342-de13f94bbd67

# change default workspace
# exercism configure --workspace="/home/nkk/Documents/code/exercism"
