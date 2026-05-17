# <PII type="CASE_ID" id="4"/> Harry2166's nvim-config

This is my NeoVim configuration, built on top of [NvChad](https://nvchad.com/).

## Features

- Fast startup with lazy loading
- LSP support for multiple languages
- Fuzzy finding with Telescope
- Git integration via Gitsigns
- Beautiful UI withNvChad's custom theme

## Installation

1. Backup existing config: `mv ~/.config/nvim ~/.config/nvim.bak`
2. Clone this repo: `git clone https://github.com/Harry2166/nvim-config.git ~/.config/nvim`
3. Open nvim and let it install plugins

## Keybindings

This config uses [NvChad](https://github.com/NvChad/NvChad) default keybindings. Check the [NvChad docs](https://nvchad.com/docs/config/keymaps) for the full list.

Custom keybindings in this config:
| Key | Action |
|-----|--------|
| `;` | Enter command mode |
| `jk` | Exit insert mode |
| `<leader>cr` | Quick Code Runner (visual) |
| `<leader>cp` | Quick Code Pad |
| `<leader>lg` | Open LazyGit |
| `<leader>lp` | Live Preview |
| `<leader>as` | Toggle auto-save |
| `<leader>fj` | Hop hint words |
| `<leader>dt` | DAP toggle breakpoint |
| `<leader>dc` | DAP continue |
| `<leader>dpr` | DAP python test method |

## Plugins

| Plugin | Description |
|--------|-------------|
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless navigation between tmux and vim panes |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Fast format on save |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Collection of snippets |
| [nvim-platformio.lua](https://github.com/anurag3301/nvim-platformio.lua) | PlatformIO integration |
| [quick-code-runner.nvim](https://github.com/jellydn/quick-code-runner.nvim) | Quick code execution |
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | Rust language support |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in gutter |
| [live-preview.nvim](https://github.com/brianhuster/live-preview.nvim) | Live preview for certain files |
| [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim) | Auto save files |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding popup |
| [hop.nvim](https://github.com/smoka7/hop.nvim) | Fast navigation |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug adapter protocol |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | DAP UI |
| [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Python DAP support |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async IO library |