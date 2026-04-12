#!/bin/sh
set -e

trap 'echo "Error: Setup failed at line $LINENO"; exit 1' ERR

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES_FILE="$DOTFILES_DIR/packages.txt"

echo "=== Arch Linux Dotfiles Setup ==="
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""
echo "This script will:"
echo "  • Install packages via pacman"
echo "  • Copy configuration files"
echo "  • Change your shell to zsh"
echo ""

read -p "Continue? (y/n) " -n 1 -r
echo
if [ "$REPLY" != "y" ] && [ "$REPLY" != "Y" ]; then
  exit 1
fi

# Verify required files exist
echo "Verifying dotfiles..."
if [ ! -f "$PACKAGES_FILE" ]; then
  echo "Error: packages.txt not found in $DOTFILES_DIR"
  exit 1
fi

if [ ! -f "$DOTFILES_DIR/.zshrc" ]; then
  echo "Error: .zshrc not found in $DOTFILES_DIR"
  exit 1
fi

echo "Installing packages..."
sudo pacman -S --needed $(grep -v '^#' "$PACKAGES_FILE" | tr '\n' ' ')

echo "Copying configuration files..."
install -D "$DOTFILES_DIR/.zshrc" ~/.zshrc
install -D "$DOTFILES_DIR/.config/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
install -D "$DOTFILES_DIR/.config/alacritty/rose-pine-dawn.toml" ~/.config/alacritty/rose-pine-dawn.toml
install -D "$DOTFILES_DIR/.config/alacritty/rose-pine-moon.toml" ~/.config/alacritty/rose-pine-moon.toml
install -D "$DOTFILES_DIR/.config/alacritty/rose-pine.toml" ~/.config/alacritty/rose-pine.toml
install -D "$DOTFILES_DIR/.config/btop/btop.conf" ~/.config/btop/btop.conf

echo "Changing shell to zsh..."
ZSH_PATH="$(which zsh)"
if [ "$SHELL" != "$ZSH_PATH" ]; then
  sudo chsh -s "$ZSH_PATH" "$USER"
  echo "✓ Shell changed to zsh (takes effect on next login)"
else
  echo "✓ Shell is already zsh"
fi

echo ""
echo "✓ Setup complete!"
echo ""
echo "Next steps:"
echo "  • Log out and log back in for shell changes to take effect"
echo "  • Open a new terminal to start using zsh"

