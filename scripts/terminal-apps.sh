#!/bin/bash

applist=(
  "ghgrab            browse and download files from GitHub, GitLab, Codeberg, Gitea, and Forgejo"
  "surge             TUI download manager"
  "check-repo        track multiple Git repositories"
  "golazo            keep up with live & recent football matches"
)

# Pipe array into rofi in dmenu mode
printf '%s\n' "${applist[@]}" | rofi -dmenu -p "TUIs" -theme-str "window { width: 90%; }"
