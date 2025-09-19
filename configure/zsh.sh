#!/bin/bash

# Get the path to zsh
ZSH_PATH=$(command -v zsh)
if [[ -z "$ZSH_PATH" ]]; then
  printf "%b\n" "${YELLOW}Zsh installation failed or zsh not found.${RC}"
  exit 1
fi
# Set zsh as the default shell for the current user
sudo chsh -s "$ZSH_PATH" "$USER"
