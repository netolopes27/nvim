# Neovim Keymaps

Leader = `Espaço`. Atalhos com `*` são buffer-local (só ativam quando o LSP/plugin anexa).

## Globais — edição & QoL

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>w` | n | Salvar (`:w`) |
| `<leader>q` | n | Fechar janela (`:q`) |
| `<Esc>` | n | Limpa highlight da busca |
| `jk` | i | Sair do modo insert |
| `<` / `>` | v | Indenta e mantém a seleção |
| `J` / `K` | v | Move linhas selecionadas para baixo/cima |
| `<C-d>` / `<C-u>` | n | Meio-page com cursor centrado |
| `n` / `N` | n | Próxima/anterior ocorrência centrada |
| `<leader>p` | v | Cola sem sobrescrever o registrador |
| `<leader>y` | n,v | Yank para o clipboard do sistema |

## Janelas, splits e buffers

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<C-h/j/k/l>` | n | Navegar entre splits |
| `<C-Up/Down/Left/Right>` | n | Redimensionar split |
| `<leader>sv` | n | Split vertical |
| `<leader>sh` | n | Split horizontal |
| `<S-l>` / `<S-h>` | n | Próximo / anterior buffer |
| `<leader>bd` | n | Fechar buffer |

## Diagnósticos

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>d` | n | Float com diagnóstico da linha |
| `[d` / `]d` | n | Diagnóstico anterior / próximo |

## LSP *

| Atalho | Modo | Ação |
| --- | --- | --- |
| `K` | n | Hover |
| `gd` | n | Ir para definição |
| `gr` | n | Referências |
| `gi` | n | Ir para implementação |
| `gt` | n | Ir para type definition |
| `<C-k>` | i | Signature help |
| `<leader>rn` | n | Renomear símbolo |
| `<leader>ca` | n,v | Code action |

## Telescope

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Live grep |
| `<leader>fb` | n | Buffers |
| `<leader>fh` | n | Help tags |
| `<leader>fr` | n | Arquivos recentes |
| `<leader>fk` | n | Lista de keymaps |
| `<leader>f/` | n | Fuzzy find no buffer atual |
| `<leader>fc` | n | Comandos |
| `<leader>fG` | n | Git files |
| `<leader>fs` | n | Symbols do documento (LSP) |
| `<leader>fws` | n | Symbols do workspace (LSP) |
| `<leader>ft` | n | Find TODOs (todo-comments) |

## Trouble

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>xx` | n | Diagnostics (workspace) |
| `<leader>xX` | n | Diagnostics do buffer atual |
| `<leader>xL` | n | Location list |
| `<leader>xQ` | n | Quickfix list |
| `<leader>xt` | n | TODOs (todo-comments) |
| `<leader>cs` | n | Symbols do documento |
| `<leader>cl` | n | LSP defs/refs (painel à direita) |

## Surround (nvim-surround)

Operadores padrão do plugin — funcionam em qualquer texto-objeto.

| Atalho | Modo | Ação |
| --- | --- | --- |
| `ys{motion}{char}` | n | Adiciona surround (ex.: `ysiw"` envolve a palavra em `"`) |
| `yss{char}` | n | Surround na linha inteira |
| `S{char}` | v | Surround na seleção |
| `ds{char}` | n | Remove o surround |
| `cs{old}{new}` | n | Troca surround (ex.: `cs"'` troca `"` por `'`) |

## Formatação (conform.nvim)

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>gf` | n,v | Formatar buffer |

## Neo-tree

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<C-n>` | n | Abrir Neo-tree à esquerda |

## DAP (debug)

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>dt` | n | Toggle breakpoint |
| `<leader>dc` | n | Continue |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step over |
| `<leader>dO` | n | Step out |
| `<leader>dx` | n | Terminate |
| `<leader>dr` | n | Abrir REPL |
| `<leader>dl` | n | Rodar última config |
| `<leader>du` | n | Toggle DAP UI |

## LazyGit

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>gg` | n | Abrir LazyGit |

## Git — gitsigns *

| Atalho | Modo | Ação |
| --- | --- | --- |
| `]c` / `[c` | n | Próximo / anterior hunk |
| `<leader>hs` | n | Stage hunk |
| `<leader>hr` | n | Reset hunk |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame da linha (full) |
| `<leader>hd` | n | Diff contra o index |

## Rust — rustaceanvim *

Ativo apenas em buffers `.rs`.

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>k` | n | Rust hover actions |

> Code action em Rust é via `<leader>ca` (LSP padrão).

## Which-key

| Atalho | Modo | Ação |
| --- | --- | --- |
| `<leader>?` | n | Popup com keymaps locais do buffer |
| `<leader>` (qualquer prefixo) | n | Popup com continuações disponíveis |

Grupos registados: `f` find, `h` hunk (git), `d` debug/diagnostic, `g` git/format, `c` code, `s` split, `b` buffer, `r` rename, `x` trouble/diagnostics.

## Legenda de modos

- `n` normal
- `i` insert
- `v` visual
