#!/bin/sh

# Setup neovim configuration symlink
NVIM_CONFIG_DIR="$HOME/.config/nvim"
REPO_NVIM_CONFIG="$(pwd)/.config/nvim"

# Backup existing config if it exists and is not a symlink
if [ -d "$NVIM_CONFIG_DIR" ] && [ ! -L "$NVIM_CONFIG_DIR" ]; then
  echo "Backing up existing nvim config to $NVIM_CONFIG_DIR.backup"
  mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.backup"
fi

# Create symlink to repository config
if [ ! -L "$NVIM_CONFIG_DIR" ]; then
  echo "Setting up nvim config symlink..."
  ln -sf "$REPO_NVIM_CONFIG" "$NVIM_CONFIG_DIR"
  echo "Neovim config linked to: $REPO_NVIM_CONFIG"
fi
