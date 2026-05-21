# Neovim config

Configuração pessoal do Neovim. Este repositório **é** o `~/.config/nvim` — não há build step, basta clonar no lugar certo e abrir o `nvim`.

## Pré-requisitos

- Neovim 0.10+
- [Droid Sans Mono Nerd Font](https://www.nerdfonts.com/) (o `.zip` está incluído no repo)
- `git`, `unzip`, `build-essential`
- `node` e `npm` (necessários para o `prettier` e alguns LSPs)
- Um compilador C (`gcc` ou `clang`) para o `nvim-treesitter`

```bash
sudo apt install git unzip build-essential nodejs npm
```

## Instalação

```bash
git clone https://github.com/<seu-usuario>/nvim ~/.config/nvim
nvim
```

Na primeira execução, o [`lazy.nvim`](https://github.com/folke/lazy.nvim) se instala sozinho e baixa todos os plugins. Depois disso:

1. `:Mason` → instale ao menos `lua-language-server` e `stylua`.
2. `:checkhealth` → confirme que está tudo verde.

## O que vem dentro

| Área | Plugin |
| --- | --- |
| Gerenciador de plugins | `lazy.nvim` |
| Tema | `catppuccin` |
| Statusline | `lualine` |
| Dashboard | `alpha-nvim` |
| Fuzzy finder | `telescope.nvim` |
| Árvore de arquivos | `neo-tree.nvim` |
| Syntax / parser | `nvim-treesitter` |
| LSP | `nvim-lspconfig` + `mason` + `mason-lspconfig` |
| Autocomplete | `nvim-cmp` + `cmp-nvim-lsp` |
| Formatação | `conform.nvim` (stylua, prettier, black) |
| Debug | `nvim-dap` + `nvim-dap-ui` + `codelldb` |
| Rust | `rustaceanvim` + `crates.nvim` |
| Git | `gitsigns.nvim` |
| Descoberta de atalhos | `which-key.nvim` |

LSPs garantidos por padrão: `lua_ls`, `pyright`. Para Rust o `rustaceanvim` gerencia o `rust-analyzer` automaticamente.

## Estrutura

```
.
├── init.lua              # bootstrap do lazy.nvim
├── lua/
│   ├── options.lua       # opções do vim + keymaps globais
│   └── plugins/          # 1 arquivo por plugin (auto-discovery)
├── lazy-lock.json        # commits fixados dos plugins
├── KEYMAPS.md            # referência completa de atalhos
└── CLAUDE.md             # notas para o Claude Code
```

Para adicionar um plugin novo, basta criar um arquivo em `lua/plugins/` retornando a spec do `lazy.nvim` — nada de registry central.

## Atalhos

Leader é `Espaço`. A lista completa está em [KEYMAPS.md](./KEYMAPS.md). Em caso de dúvida, aperte `<leader>` e o `which-key` mostra as continuações disponíveis.

Resumo do que se usa todo dia:

| Atalho | Ação |
| --- | --- |
| `<leader>ff` / `<leader>fg` | Find files / live grep (Telescope) |
| `<C-n>` | Toggle Neo-tree |
| `K` / `gd` / `gr` | Hover / definição / referências (LSP) |
| `<leader>ca` / `<leader>rn` | Code action / rename |
| `<leader>gf` | Formatar buffer |
| `<leader>dt` / `<leader>dc` | Breakpoint / continue (DAP) |
| `<S-l>` / `<S-h>` | Próximo / anterior buffer |
| `jk` | Sair do insert |

## Manutenção

- `:Lazy sync` depois de mexer em qualquer spec.
- `stylua .` antes de commitar Lua.
- Commit do `lazy-lock.json` mantém a config reproduzível entre máquinas.
