#!/bin/bash

RC='\033[0m'
YELLOW='\033[33m'
GREEN='\033[32m'

git config --global user.name "kshitiz"
git config --global user.email "karki.kshitiz.23@gmail.com"
git config --global init.defaultBranch main
printf "%b\n" "${YELLOW}Run below commands, upload the generated key to github!${RC}"
printf "%b\n" "${GREEN}ssh-keygen -t ed25519 -C "karki.kshitiz.23@gmail.com"${RC}"
printf "%b\n" "cat ~/.ssh/id_ed25519.pub${RC}"
