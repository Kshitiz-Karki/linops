#!/bin/bash

TERMINAL=foot
BLUETUI=bluetui-v0.8.1
NMTUI=nmtui-go_0.2.7
SUPER=

labels=(
  # "󰃀  Quick links       [Super + Shift + m & q]"   # use vimium browser extension
  # "󰖟  Web search / bangs    [Super + Shift + m & i]" # not useful because of vimium extension
  "  Sway keybinds             [$SUPER + Alt + k]"
  "  Vimium keybinds           [$SUPER + Alt + v]"
  "󰂯  Bluetooth                 [$SUPER + Alt + b]"
  "  Audio                     [$SUPER + Alt + a]"
  "  Wifi                      [$SUPER + Alt + w]"
  "󰍜  Toggle Waybar             [$SUPER + Alt + t]"
  # "  Projects              [Super + Shift + m & p]"
  "  Tmux sessions             [$SUPER + Alt + s]"
  "  Clipboard history list    [$SUPER    +    c]"
  "  Power                     [$SUPER + Alt + x]"
)

choice=$(
  printf '%s\n' "${labels[@]}" |
    rofi -dmenu -matching fuzzy -i -p "Choose"
)

echo "choice: ${choice}"

case "${choice,,}" in
# *search*) ~/Documents/linops/scripts/web-search.sh ;;
*sway*) ~/Documents/linops/scripts/keybindings-sway.sh ;;
*vimium*) ~/Documents/linops/scripts/keybindings-vimium.sh ;;
*bluetooth*) pidof $BLUETUI || $TERMINAL --app-id=bluetui -e ~/bin/$BLUETUI ;;
*audio*) pidof wiremix || $TERMINAL --app-id=wiremix -e /usr/bin/wiremix ;;
*wifi*) pidof $NMTUI || $TERMINAL --app-id=nmtui-go -e ~/bin/$NMTUI ;;
*toggle*) ~/Documents/linops/scripts/toggle-waybar.sh ;;
*sessions*) ~/Documents/linops/scripts/tmux-session ;;
*clipboard*) ~/Documents/linops/scripts/cliphist-lookup-rofi ;;
*power*) rofi -show power-menu -modi power-menu:~/Documents/github/rofi-power-menu/rofi-power-menu ;;
esac

# alternate way **********************************
# declare -A options=(
#   ["󰃀  Quick links"]="$HOME/Documents/linops/scripts/quicklinks.sh"
#   ["  Keybindings"]="$HOME/Documents/linops/scripts/keybindings.sh"
#   ["󰂯  Bluetooth"]="$HOME/Documents/linops/scripts/bluetui.sh $TERMINAL $BLUETUI"
# )
#
# option=$(
#   printf '%s\n' "${!options[@]}" |
#     sort |
#     rofi -dmenu -i -p "Choose"
# )

# echo "option: ${options[$option]}"

# ${options[$option]}
# Use bash -c if command is not just a file path
# bash -c ${options[$option]}
# exec ${options[$option]}
# end ***********************************
