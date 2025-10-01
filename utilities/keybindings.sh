#!/bin/bash

bindings=(
  "Super + Return                 ->          kitty terminal"
  "Super + Space                  ->          app launcher"
  "Super + Alt + Space            ->          menu launcher"
  "Super + q                      ->          close/kill window"
  "Super + b                      ->          launch brave browser"
  "Super + Shift + c              ->          reload sway configuration"
  "Super + Shift + e              ->          exit from sway wm"
  "Super + z                      ->          horizontal split"
  "Super + v                      ->          vertical split"
  "Super + s                      ->          switch to 'stacking' layout"
  "Super + w                      ->          switch to 'tabbed' layout"
  "Super + e                      ->          switch to 'toggle split' layout"
  "Super + f                      ->          make current window fullscreen"
  "Super + Shift + Space          ->          toggle between tiling & floating mode"
  "Super + a                      ->          focus parent container"
  "Super + r + (  ,  ,  ,  )  ->          shrink/grow current window (resize)"
  "Super + o                      ->          toggle waybar"
  "Alt + Tab                      ->          switch between current & last workspace"
  "Super + l                      ->          lock screen"
  "Super + Shift + r              ->          screenshot - region"
  "Super + Shift + w              ->          screenshot - window"
  "PrintScreen                    ->          screenshot - fullscreen"
)

# Pipe array into rofi in dmenu mode
printf '%s\n' "${bindings[@]}" | rofi -dmenu -p "Search"
