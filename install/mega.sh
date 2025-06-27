set -e

cd ~/Downloads/

if [ "$ID" == "arch" ]; then
  wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-x86_64.pkg.tar.zst && sudo pacman -U "$PWD/megasync-x86_64.pkg.tar.zst"
  rm megasync-x86_64.pkg.tar.zst
  sudo pacman -Sy --noconfirm
elif [ "$ID" == "fedora" ]; then
  wget https://mega.nz/linux/repo/Fedora_42/x86_64/megasync-Fedora_42.x86_64.rpm && sudo dnf install -y "$PWD/megasync-Fedora_42.x86_64.rpm"
  rm megasync-Fedora_42.x86_64.rpm
else
  printf "%b\n" "${YELLOW}No scipts present for ${ID}, exiting ...${RC}"
  exit 1
fi

cd -
