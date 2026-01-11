#!/bin/sh

echo "This script is intended to be used on archlinux (btw)"
sudo pacman -S \
  wget curl git \
  signal-desktop \
  vlc vlc-plugins-all \
  zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting \
  fastfetch \
  code \
  fzf eza bat btop \
  zellij

cp .zshrc ~/.zshrc
