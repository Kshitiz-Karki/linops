set -e

# add debloat scripts for brave, https://github.com/MulesGaming/brave-debloatinator
sudo mkdir /etc/brave/policies/managed -p
sudo cp ~/Downloads/configurator/configs/brave_debullshitinator-policies.json /etc/brave/policies/managed

if [ "$ID" == "arch" ]; then
  yay -S --noconfirm --needed brave-bin
elif [ "$ID" == "fedora" ]; then
  sudo dnf install -y dnf-plugins-core
  sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
  sudo dnf install -y brave-browser
else
  printf "%b\n" "${YELLOW}No scripts present for ${ID}, exiting ...${RC}"
  exit 1
fi
