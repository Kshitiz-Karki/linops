#!/bin/bash

TERMINAL=foot
BLUETUI=bluetui-v0.8.1
NMTUI=nmtui-go_0.2.7
SUPER=
SCRIPTS_PATH=~/Documents/linops/scripts
SCRIPTS_PATH_LAUNCHER=~/Documents/linops/scripts/rofi

labels=(
  # "󰃀  Quick links       [Super + Shift + m & q]"   # use vimium browser extension
  # "󰖟  Web search / bangs    [Super + Shift + m & i]" # not useful because of vimium extension
  "  Installed TUI/CLI apps"
  "  Sway keybinds             [$SUPER + Alt + k]"
  "  Vimium keybinds           [$SUPER + Alt + v]"
  # "󰂯  Bluetooth                 [$SUPER + Alt + b]"
  "  Audio                     [$SUPER + Alt + a]"
  # "  Wifi                      [$SUPER + Alt + w]"
  "󰍜  Toggle Waybar             [$SUPER + Alt + t]"
  "  Projects                  [$SUPER    +    p]"
  "  Tmux sessions             [$SUPER    +    s]"
  "  Clipboard history         [$SUPER    +    c]"
  "  Power                     [$SUPER + Alt + x]"
)

choice=$(
  printf '%s\n' "${labels[@]}" |
    rofi -dmenu -matching fuzzy -i -p "Choose"
)

echo "choice: ${choice}"

case "${choice,,}" in
# *search*) ~/Documents/linops/scripts/web-search.sh ;;
*apps*) $SCRIPTS_PATH_LAUNCHER/terminal-apps.sh ;;
*sway*) $SCRIPTS_PATH_LAUNCHER/keybindings-sway.sh ;;
*vimium*) $SCRIPTS_PATH_LAUNCHER/keybindings-vimium.sh ;;
# *bluetooth*) pidof $BLUETUI || $TERMINAL --app-id=bluetui -e ~/.local/bin/$BLUETUI ;;
*audio*) pidof wiremix || $TERMINAL --app-id=wiremix -e /usr/bin/wiremix ;;
# *wifi*) pidof $NMTUI || $TERMINAL --app-id=nmtui-go -e ~/.local/bin/$NMTUI ;;
*toggle*) $SCRIPTS_PATH/toggle-waybar.sh ;;
*projects*) $SCRIPTS_PATH_LAUNCHER/tmux-projects ;;
*sessions*) $SCRIPTS_PATH_LAUNCHER/tmux-sessions ;;
*clipboard*) $SCRIPTS_PATH_LAUNCHER/cliphist-lookup ;;
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
