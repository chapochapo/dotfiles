#!/bin/sh

echo "This script is intended to be used on archlinux (btw)"
sudo pacman -S \
  wget curl git \
  signal-desktop \
  vlc vlc-plugins-all \
  zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting \
  fastfetch \
  code \
  fzf eza bat btop

wget https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-x86_64-unknown-linux-musl.tar.gz -P ~/
tar -xvf ~/zellij*.tar.gz
chmod +x ~/zellij

cp .zshrc ~/.zshrc
