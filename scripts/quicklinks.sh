#!/bin/bash

# Path to your txt file with URLs
URL_FILE="$HOME/Documents/code/linops/utilities/urls.txt"

# Use rofi (or dmenu) to select a URL
CHOICE=$(cat "$URL_FILE" | rofi -dmenu -p "Open URL")

# If something was selected, open it in default browser
if [ -n "$CHOICE" ]; then
  # remove all whitespace
  clean=$(echo "$CHOICE" | tr -d '[:space:]')
  # take everything after the first ']'
  result="${clean#*]}"
  xdg-open "$result" >/dev/null 2>&1 &
  swaymsg '[app_id="brave"] focus'
fi
