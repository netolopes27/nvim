# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal Neovim configuration. The repo *is* `~/.config/nvim` — files here are loaded directly by Neovim at startup. There is no build step; "running" the code means launching `nvim`.

## Plugin management (lazy.nvim)

`init.lua` bootstraps `lazy.nvim` and calls `require("lazy").setup("plugins")`. That single call **auto-discovers every file under `lua/plugins/`** and treats each one's return value as a plugin spec (or list of specs). Consequences:

- To add a plugin, drop a new file in `lua/plugins/` returning a lazy spec table. No central registry to edit.
- File name is irrelevant to lazy.nvim — grouping is by topic, not by load order.
- `lazy-lock.json` pins plugin commits. Commit it after `:Lazy sync` / `:Lazy update` so the config is reproducible.

## Keymap convention

Keymaps are **co-located with the plugin that owns them**, inside that plugin's `config = function()` or `keys = { ... }` lazy spec. For example, Telescope's `<leader>f*` keys live in `lua/plugins/telescope.lua`, LSP's `K`/`gd`/`<leader>ca` live in `lua/plugins/lsp.lua`. Global keymaps not tied to any plugin go in `lua/options.lua`.

Leader key is **Space** (set in `lua/options.lua`).

`which-key.nvim` is installed — pressing `<leader>` shows a popup with the available continuations, so you don't need to memorize the full set.

## LSP / DAP / formatters / linters

- LSP servers and DAP adapters are installed via **Mason** (`:Mason`). `mason-lspconfig` has `ensure_installed = { "lua_ls", "pyright" }`; `mason-nvim-dap` has `ensure_installed = { "codelldb" }`. Both also have `automatic_installation = true`.
- Formatters and linters are auto-installed by **mason-tool-installer** (spec in `lua/plugins/lsp.lua`): `ensure_installed = { "stylua", "prettier", "black", "ruff" }`. Add new CLI tools there, not in the README as a manual step.
- Completion capabilities come from `cmp_nvim_lsp` and are passed into every `lspconfig.*.setup` call — preserve this when adding new servers.
- Formatting goes through **conform.nvim** (`lua/plugins/conform.lua`): `formatters_by_ft` maps filetypes to formatters (stylua, prettier, black). **Format-on-save is enabled** (guarded by `vim.g.disable_autoformat` / `vim.b.disable_autoformat`, toggled via `:FormatDisable[!]` / `:FormatEnable`); manual trigger is `<leader>gf`.
- Linting goes through **nvim-lint** (`lua/plugins/lint.lua`): `linters_by_ft` currently maps python → ruff, running on BufReadPost/BufWritePost/InsertLeave.
- Rust has its own path via **rustaceanvim** (`lua/plugins/rustaceanvim.lua`), which auto-configures `rust-analyzer` and wires `codelldb` from Mason into nvim-dap. Do not add a `rust_analyzer` setup in `lsp.lua` — rustaceanvim handles it.
- `lsp.lua` deletes Neovim 0.11's default `gr*` keymaps (`grn`, `grr`, `gri`, `gra`, `grt`) so the custom `gr` (references) fires without the keymap timeout — don't re-add bindings under the `gr` prefix.

## Editing this config

- Format Lua files with `stylua .` before committing (matches the in-editor `<leader>gf`).
- After changing a plugin spec, run `:Lazy sync` inside Neovim to apply.
- `lua/options.lua` is the place for vim options and any keymap that isn't tied to a plugin.

## Setup prerequisites (from README)

Neovim **0.11+** (the config uses `vim.lsp.config`/`vim.lsp.enable`/`vim.diagnostic.jump`), a Nerd Font, `unzip`, `build-essential` (also compiles `telescope-fzf-native` via `make`). Everything else (LSPs, DAP, formatters, linters) is auto-installed by Mason on first launch — no manual `:Mason` step needed. Full from-scratch instructions live in `README.md`.
