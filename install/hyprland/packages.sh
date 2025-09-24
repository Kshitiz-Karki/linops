#!/bin/bash

sudo dnf copr enable solopasha/hyprland

sudo dnf install -y hyprland hyprshot satty

sudo dnf install -y \
  mako \
  pamixer \
  rofi \
  slurp \
  swaybg \
  waybar \
  wiremix \
  wlsunset

# sudo dnf copr enable markupstart/SwayOSD
# sudo dnf install swayosd
