# Neovim Configuration

Lazy.nvim-based configuration with comprehensive LSP support, managed through DevBox.

## Features

- **LSP Support**: Lua, Rust, Go, TypeScript, Python, Bash, Docker, YAML, JSON, HTML, CSS, Tailwind
- **Fuzzy Finding**: Telescope with FZF integration
- **File Explorer**: Neo-tree
- **Syntax Highlighting**: Treesitter
- **Git Integration**: Gitsigns
- **Autocompletion**: nvim-cmp with LSP support
- **UI Enhancements**: Tokyo Night theme, Lualine status line, indent guides
- **Utilities**: Auto-pairs, comments, which-key

## Key Bindings

### General
- `<Space>` - Leader key
- `<leader>e` - Toggle file explorer (Neo-tree)

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fs` - Git files

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename

### Completion
- `<C-p>` - Previous item
- `<C-n>` - Next item
- `<C-y>` - Confirm selection
- `<C-Space>` - Trigger completion

## Setup

The configuration is automatically linked when you enter the devbox shell:

```bash
make dev
```

This will:
1. Install all LSP servers and tools via DevBox
2. Link the nvim config from this repository to `~/.config/nvim`
3. On first nvim launch, Lazy.nvim will install all plugins automatically

### Testing Setup

To test that everything is working correctly:

```bash
# Inside devbox shell
.devbox/test-nvim.sh
```

This will verify:
- Neovim is available
- Config is properly linked
- All plugins can be synced

### First Time Setup

When you first open nvim, it will:
1. Clone lazy.nvim plugin manager
2. Install all configured plugins
3. Setup LSP servers via Mason

This may take a few minutes. Just wait for all plugins to install.

## LSP Servers Included

All LSP servers are installed via DevBox packages:
- Lua: lua-language-server
- Rust: rust-analyzer
- Go: gopls
- TypeScript/JavaScript: typescript-language-server
- Python: pyright
- Bash: bash-language-server
- Docker: dockerfile-language-server-nodejs
- YAML: yaml-language-server
- JSON/HTML/CSS: vscode-langservers-extracted
- Tailwind: tailwindcss

## Customization

Add your custom plugins in `lua/plugins/` directory. Each file should return a table of plugin specifications.

Example:
```lua
-- lua/plugins/my-plugin.lua
return {
  {
    "author/plugin-name",
    config = function()
      -- plugin configuration
    end,
  },
}
```
