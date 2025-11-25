#!/bin/sh

# Initialize starship for fish shell
if command -v starship >/dev/null 2>&1; then
  # Create fish config directory if it doesn't exist
  mkdir -p ~/.config/fish/conf.d

  # Initialize starship for fish shell
  starship init fish > ~/.config/fish/conf.d/starship.fish 2>/dev/null || true

  # Copy starship configuration (always update to ensure latest version)
  if [ -f "$(pwd)/.config/starship.toml" ]; then
    mkdir -p ~/.config
    cp "$(pwd)/.config/starship.toml" ~/.config/starship.toml
    echo "Starship configuration updated in ~/.config/starship.toml"
  fi

  # Copy fish functions to fish config
  if [ -f "$(pwd)/.devbox/fish-functions.fish" ]; then
    cp "$(pwd)/.devbox/fish-functions.fish" ~/.config/fish/conf.d/devbox-functions.fish
    echo "DevBox fish functions installed"
  fi

  echo "Starship initialized for fish shell"
fi