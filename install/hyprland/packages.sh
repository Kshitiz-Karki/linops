#!/bin/bash

sudo dnf copr enable solopasha/hyprland

sudo dnf install -y hyprland hyprlock hyprshot hyprsunset satty uwsm
# hypridle //not required
# hyprpicker

sudo dnf install -y \
  alacritty \
  brightnessctl \
  fastfetch \
  gnome-themes-extra \
  gtk4-layer-shell \
  kvantum-qt5 \
  mako \
  pamixer \
  rofi-wayland \
  slurp \
  swaybg \
  waybar \
  wiremix \
  xdg-desktop-portal-hyprland

# sudo dnf copr enable markupstart/SwayOSD
# sudo dnf install swayosd
