set -e

clear #clear screen

cat <<"EOF"
 _____              __ _                       _             
/  __ \            / _(_)                     | |            
| /  \/ ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ ___  _ __ 
| |    / _ \| '_ \|  _| |/ _` | | | | '__/ _` | __/ _ \| '__|
| \__/\ (_) | | | | | | | (_| | |_| | | | (_| | || (_) | |   
 \____/\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__\___/|_|   
                          __/ |                              
                         |___/                               
EOF

RC='\033[0m'
YELLOW='\033[33m'

printf "%b\n" "${YELLOW}Cloning setup...${RC}"
rm -rf ~/Downloads/configurator
git clone --depth 1 https://github.com/Kshitiz-Karki/configurator.git ~/Downloads/configurator >/dev/null

. /etc/os-release

if [ "$ID" == "arch" ]; then
  source ~/Downloads/configurator/arch.sh
elif [ "$ID" == "fedora" ]; then
  source ~/Downloads/configurator/fedora.sh
else
  printf "%b\n" "${YELLOW}No scipts present for ${ID}, exiting ...${RC}"
  exit 1
fi

source ~/Downloads/configurator/common.sh

printf "%b\n" "${YELLOW}Setup complete! Reboot? (y)${RC}"

read user_input
if [[ "$user_input" == "y" ]]; then
  shutdown -r now
fi
