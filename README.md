# LINOPS

My Sway wm based personal (not so asthetic but productivity-oriented) dotfiles and packages installer after a fresh linux installation. Should work on fedora and cachyos.

## Requirements

Ensure you have the following installed on your system:
  - git

## Installation

First, setup git, generate and upload ssh key to github.com

```
git config --global user.name "xxx"
git config --global user.email "xxx@gmail.com"
git config --global init.defaultBranch main
# upload the generated key to github
ssh-keygen -t ed25519 -C "xxx@gmail.com"
cat ~/.ssh/id_ed25519.pub
```

then git clone this repo and run install.sh

```
$ curl ...
```
