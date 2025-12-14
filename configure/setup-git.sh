git config --global user.name "kshitiz"
git config --global user.email "karki.kshitiz.23@gmail.com"
git config --global init.defaultBranch main
#Run below commands, upload the generated key to github!
ssh-keygen -t ed25519 -C "karki.kshitiz.23@gmail.com"
cat ~/.ssh/id_ed25519.pub
