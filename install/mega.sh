set -e

cd ~/Downloads/

if [ "$ID" == "arch" ]; then
  yay -Sy --noconfirm --needed megasync-bin
elif [ "$ID" == "fedora" ]; then
  wget https://mega.nz/linux/repo/Fedora_42/x86_64/megasync-Fedora_42.x86_64.rpm && sudo dnf install -y "$PWD/megasync-Fedora_42.x86_64.rpm"
  rm megasync-Fedora_42.x86_64.rpm
else
  printf "%b\n" "${YELLOW}No scipts present for ${ID}, exiting ...${RC}"
  exit 1
fi

cd -
