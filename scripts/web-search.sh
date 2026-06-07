#!/bin/bash

declare -A bangs=(
  ["gg"]="https://www.google.com/search?q=%s"
  ["yt"]="https://www.youtube.com/results?search_query=%s"
  ["gh"]="https://github.com/search?q=%s"
  ["nv"]="https://www.woerter.net/?w=%s"
  ["lide"]="https://www.linguee.de/deutsch-englisch/search?source=auto&query=%s"
  ["db"]="https://duckduckgo.com/bangs?q=%s"
)

declare -A names=(
  ["gg"]="google"
  ["yt"]="youtube"
  ["gh"]="github"
  ["nv"]="netzverb"
  ["lide"]="linguee"
  ["db"]="duckduckgo bangs"
)

# Prompt user via rofi
input=$(
  for bang in "${!bangs[@]}"; do
    printf "%s    %s\n" "$bang" "${names[$bang]}"
  done | sort | rofi -dmenu -matching fuzzy -i -p "Web search"
)

# Exit if empty
[ -z "$input" ] && exit 0

read -r bang query <<<"$input"

# echo "bang: "$bang
# echo "query: "$query

if [[ "$query" == ""* ]]; then
  #echo "Starts with "
  query=$(
    rofi -dmenu -p "search${query#* }: " -l 0 -matching fuzzy \
      -theme ~/.config/rofi/input.rasi
  )
  if [[ -z "$query" && -n "$bang" ]]; then
    exit 0
  fi
fi

# echo "query: "$query

if [[ -z "$query" && -n "$bang" ]]; then
  # -z = checks if string is empty
  #  -n - checks if string is non-empty
  # default case: perform brave search
  xdg-open "https://search.brave.com/search?q=$bang"
  swaymsg workspace 1
  exit 0
fi

# echo "${bangs[$bang]}"
#
url_template="${bangs[$bang]}"
# echo "url_template: "$url_template
[ -z "$url_template" ] && exit 0

printf -v url "$url_template" "${query// /+}"

xdg-open "$url"
swaymsg workspace 1

# query=$(
#   printf "" | fuzzel --config="$HOME/.config/fuzzel/web-search.ini" --dmenu
# )
