#!/bin/bash

#change current remote
git remote -v

# change remote
git remote set-url origin https://github.com/username/repo.git
#or
git remote set-url origin git@github.com:username/repo.git

git config --global user.name "xxx"
git config --global user.email "xxx@gmail.com"
git config --global init.defaultBranch main
# upload the generated key to github
ssh-keygen -t ed25519 -C "xxx@gmail.com"
cat ~/.ssh/id_ed25519.pub
