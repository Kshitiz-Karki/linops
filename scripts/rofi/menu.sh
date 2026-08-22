#!/bin/bash

TERMINAL=foot
BLUETUI=bluetui-v0.8.1
NMTUI=nmtui-go_0.2.7
SUPER=
SCRIPTS_PATH=~/Projects/linops/scripts
SCRIPTS_PATH_LAUNCHER=~/Projects/linops/scripts/rofi
# 󰃀
labels=(
  "  ls ~/.local/bin"
  "  Niri keybinds             [ $SUPER    +     / ]"
  "󰖟  Quick links               [ $SUPER + Ctrl + W ]"
  "  Web search / bangs        [ $SUPER + Ctrl + S ]"
  # "  Sway keybinds             [$SUPER + Alt + k]"
  # "  Vimium keybinds           [$SUPER + Alt + v]"
  # "󰂯  Bluetooth                 [$SUPER + Alt + b]"
  # "  Audio                     [$SUPER + Alt + a]"
  # "  Wifi                      [$SUPER + Alt + w]"
  # "󰍜  Toggle Waybar             [$SUPER + Alt + t]"
  "  Projects                  [ $SUPER + Ctrl + P ]"
  "  Tmux sessions             [ $SUPER + Ctrl + T ]"
  "  Clipboard history         [ $SUPER + Ctrl + C ]"
  "  Power                     [ $SUPER + Ctrl + X ]"
)

choice=$(
  printf '%s\n' "${labels[@]}" |
    rofi -dmenu -matching fuzzy -i -p "Choose"
)

echo "choice: ${choice}"

case "${choice,,}" in
*local*) $SCRIPTS_PATH_LAUNCHER/local-bin-apps.sh ;;
*quick*) noctalia msg panel-toggle launcher /web ;;
*search*) $SCRIPTS_PATH_LAUNCHER/web-search.sh ;;
*apps*) $SCRIPTS_PATH_LAUNCHER/local-bin-apps.sh ;;
*sway*) $SCRIPTS_PATH/sway/keybinds ;;
*niri*) $SCRIPTS_PATH/niri/keybinds ;;
# *vimium*) $SCRIPTS_PATH_LAUNCHER/keybinds-vimium.sh ;;
# *bluetooth*) pidof $BLUETUI || $TERMINAL --app-id=bluetui -e ~/.local/bin/$BLUETUI ;;
# *audio*) pidof wiremix || $TERMINAL --app-id=wiremix -e /usr/bin/wiremix ;;
# *wifi*) pidof $NMTUI || $TERMINAL --app-id=nmtui-go -e ~/.local/bin/$NMTUI ;;
# *toggle*) $SCRIPTS_PATH/toggle-waybar.sh ;;
*projects*) $SCRIPTS_PATH_LAUNCHER/tmux-projects ;;
*sessions*) $SCRIPTS_PATH_LAUNCHER/tmux-sessions ;;
*clipboard*) noctalia msg panel-toggle clipboard ;;
*power*) noctalia msg panel-toggle session ;;
# *power*) rofi -show power-menu -modi power-menu:"${SCRIPTS_PATH_LAUNCHER}/power-menu" ;;
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
