#!/bin/bash

set -e

clear

export REPO_NAME="linops"
export REPO_PATH="$HOME/Projects/$REPO_NAME"

rm -rf $REPO_PATH
git clone "git@github.com:Kshitiz-Karki/${REPO_NAME}.git" $REPO_PATH >/dev/null

echo -e "\nInstallation starting..."
source "$REPO_PATH/install.sh"
