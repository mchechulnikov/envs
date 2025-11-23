#!/bin/sh

# Test neovim installation in devbox
echo "Testing neovim setup..."
echo ""

# Check if nvim is available
if ! command -v nvim >/dev/null 2>&1; then
  echo "❌ Error: nvim not found in PATH"
  exit 1
fi

echo "✅ Neovim found: $(nvim --version | head -1)"
echo ""

# Check if config is linked
if [ -L "$HOME/.config/nvim" ]; then
  echo "✅ Config symlink exists: $HOME/.config/nvim -> $(readlink $HOME/.config/nvim)"
else
  echo "⚠️  Config is not a symlink"
fi
echo ""

# Test nvim can start and lazy.nvim is installed
echo "Testing nvim startup and plugin installation..."
nvim --headless "+Lazy! sync" +qa 2>&1
if [ $? -eq 0 ]; then
  echo "✅ Neovim started successfully and plugins synced"
else
  echo "❌ Neovim failed to start or sync plugins"
  exit 1
fi

echo ""
echo "All checks passed! You can now run: nvim"
