set -e

if [ "$ID" == "arch" ]; then
  sudo pacman -Sy --needed gum
elif [ "$ID" == "fedora" ]; then
  brew install gum
else
  printf "%b\n" "${YELLOW}No scipts present for ${ID}, exiting ...${RC}"
  exit 1
fi
