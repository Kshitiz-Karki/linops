wget -qO- https://raw.githubusercontent.com/Kshitiz-Karki/omarchy/refs/heads/master/boot.sh | bash

sudo pacman -S --noconfirm --needed hyprland wofi waybar ttf-font-awesome



windowrulev2 = workspace 10, class:^(obs)$
windowrulev2 = focus, class:^(obs)$

hyprctl reload
