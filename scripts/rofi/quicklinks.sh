#!/bin/bash

URLS=(
  "[translate]  https://translate.google.com/?sl=de&tl=en&op=translate"
  "[deutsch]  https://der-artikel.de/"
  "[deutsch]  https://www.linguee.de/"
  "[deutsch]  https://lingvist.com/course/learn-german-online/resources/german-alphabet/"
)

# Use rofi to select a URL
CHOICE=$(printf '%s\n' "${URLS[@]}" | rofi -dmenu -p "Open URL")

# If something was selected, open it in default browser
if [ -n "$CHOICE" ]; then
  # remove all whitespace
  clean=$(echo "$CHOICE" | tr -d '[:space:]')
  # take everything after the first ']'
  result="${clean#*]}"
  xdg-open "$result" >/dev/null 2>&1 &
  sleep 0.1
  if pgrep -x sway >/dev/null; then
    swaymsg '[app_id="brave"] focus'
  fi
fi
