if [ "$ID" == "arch" ]; then
  #https://www.youtube.com/watch?v=odgD_RdJjCU
  #https://kskroyal.com/10-things-to-do-after-installing-arch-linux-2023/
  sudo pacman -Syu --noconfirm
  sudo pacman -Sy --needed --noconfirm git
  sudo cp /etc/pacman.conf /etc/pacman.conf.bak
  sudo sed -i 's/^#Color$/Color/' /etc/pacman.conf
  sudo sed -i '/^#DisableSandbox/a ILoveCandy' /etc/pacman.conf
  sudo pacman -Sy --noconfirm
  sudo pacman -Sy --needed --noconfirm reflector
  sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
  sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
  sudo pacman -Sy --noconfirm
fi
