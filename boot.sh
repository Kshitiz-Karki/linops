#!/bin/bash

set -e

clear

export REPO_NAME="linops"
mkdir -p ~/Projects
export REPO_PATH="$HOME/Projects/$REPO_NAME"

rm -rf $REPO_PATH
git clone "https://github.com:Kshitiz-Karki/${REPO_NAME}.git" $REPO_PATH >/dev/null

source "$REPO_PATH/install.sh"
