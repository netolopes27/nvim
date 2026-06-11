# ⚡ Neovim Modern Config

Uma configuração pessoal do Neovim **0.11+** projetada para velocidade, beleza visual e máxima produtividade. Utiliza o **`lazy.nvim`** para gerenciar os plugins com carregamento preguiçoso (lazy-loading) inteligente, garantindo inicialização quase instantânea.

O repositório é, por si só, a pasta `~/.config/nvim`. Não há compilação ou processos complexos: basta clonar e executar para ver a mágica acontecer!

---

## ✨ Destaques da Configuração

- **⚡ Bootstrapping 100% Automático**: Basta clonar e abrir o editor. O `lazy.nvim` se instala e baixa tudo automaticamente no primeiro início.
- **🛠️ Mason Integration**: Gestão centralizada e nativa de servidores LSP, adaptadores DAP, formatadores e linters com atualizações em um clique.
- **🎨 Visual Premium (Catppuccin Mocha)**: Estética escura moderna com destaque semântico via `Treesitter`, statusline otimizada com `lualine` e tela de início customizada com `alpha-nvim`.
- **🔍 Busca Fuzzy Potente**: Encontre arquivos, termos globais (grep), histórico, documentações, buffers e muito mais instantaneamente via `Telescope`, com sorter nativo compilado (`telescope-fzf-native`) para máxima velocidade.
- **🌳 Navegação Avançada**: Explorador de arquivos robusto com `Neo-tree` e visualizador elegante de diagnósticos/erros com `Trouble`.
- **⚙️ Formatação Inteligente**: Formatação automática ao salvar (e sob demanda com `<leader>gf`) via `conform.nvim`, suportando `stylua`, `prettier` e `black` — desative quando quiser com `:FormatDisable`.
- **🧪 Linting em Tempo Real**: Diagnósticos extras com `nvim-lint` (`ruff` para Python), complementando o LSP.
- **📦 Zero Setup de Ferramentas**: `mason-tool-installer` baixa automaticamente os formatadores e linters (`stylua`, `prettier`, `black`, `ruff`) no primeiro boot.
- **🚀 Integração Git de Elite**: Acompanhamento de alterações em tempo real via `gitsigns` na calha lateral e interface interativa completa do `LazyGit` flutuante na tela.
- **🦀 Suporte de Primeira Classe para Rust**: Configuração automatizada avançada para desenvolvimento Rust via `rustaceanvim` + `crates.nvim`.

---

## 📋 Pré-requisitos do Sistema

Para aproveitar todo o poder desta configuração (LSPs, buscas e formatações), você precisará das seguintes dependências em sua máquina:

### 1. Neovim 0.11 ou superior (obrigatório)

> [!IMPORTANT]
> Esta configuração usa APIs novas do Neovim (`vim.lsp.config`, `vim.lsp.enable`, `vim.diagnostic.jump`) e o `mason-lspconfig` v2, que **exigem o Neovim 0.11+**. O `apt` do Ubuntu/Debian instala uma versão antiga demais — use uma das opções abaixo.

**Ubuntu / Debian — opção A (PPA):**
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install -y neovim
```

**Ubuntu / Debian / qualquer distro — opção B (tarball oficial, sempre atualizado):**
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
rm nvim-linux-x86_64.tar.gz
```

**Arch Linux:**
```bash
sudo pacman -S neovim
```

Confirme a versão antes de prosseguir (deve mostrar `NVIM v0.11` ou superior):
```bash
nvim --version | head -n1
```

### 2. Ferramentas Globais
- **Git** (para clonagem e gerenciamento de plugins)
- **Curl** (para downloads do Mason e do bootstrap)
- **Unzip** (para o Mason extrair pacotes)
- **Compiler C** (`gcc` ou `clang`) e `make` (necessários para compilar parsers do `nvim-treesitter`)
- **Node.js & npm** (necessários para vários LSPs e o formatador `prettier`)
- **Python 3 & pip** (para LSPs Python e formatador `black`)
- **Ripgrep & fd-find** (essenciais para buscas ultrarrápidas no `Telescope`)
- **LazyGit** (opcional, para a interface Git integrada)

#### Comando de Instalação Rápida (Ubuntu / Debian):
```bash
# Atualiza repositórios
sudo apt update

# Instala ferramentas básicas, compilador, Node.js e Ripgrep/Fd
sudo apt install -y git curl unzip build-essential nodejs npm ripgrep fd-find python3-pip python3-venv

# No Ubuntu/Debian o binário do fd-find chama-se "fdfind"; crie o link "fd" para o Telescope encontrá-lo
mkdir -p ~/.local/bin
ln -sf "$(which fdfind)" ~/.local/bin/fd

# Instalação do LazyGit (caso queira usar o atalho <leader>gg)
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin/
rm lazygit lazygit.tar.gz
```

> [!NOTE]
> Garanta que `~/.local/bin` está no seu `PATH` (na maioria das instalações modernas já está). Caso contrário, adicione `export PATH="$HOME/.local/bin:$PATH"` ao seu `~/.bashrc` ou `~/.zshrc`.

#### Comando de Instalação Rápida (Arch Linux):
```bash
sudo pacman -Syu --needed git curl unzip base-devel nodejs npm ripgrep fd python-pip lazygit
```

### 3. Fonte Nerd Font
Esta configuração utiliza ícones modernos que exigem uma **Nerd Font**. A recomendada é a **Droid Sans Mono Nerd Font**, baixada direto do repositório oficial do Nerd Fonts:

```bash
# Crie a pasta de fontes local caso não exista
mkdir -p ~/.local/share/fonts

# Baixe e extraia a fonte do release oficial do Nerd Fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.local/share/fonts/DroidSansMono
rm DroidSansMono.zip

# Atualize o cache de fontes do sistema
fc-cache -fv
```
*Lembre-se de configurar o seu terminal (ex: Alacritty, Kitty, GNOME Terminal, etc.) para utilizar a fonte instalada: **`DroidSansMono Nerd Font`**.*

---

## 🚀 Instalação Passo a Passo (Do Zero)

Siga estes passos simples para clonar e rodar a configuração em qualquer máquina:

### Passo 1: Backup da Configuração Antiga (Se houver)
Caso você já tenha dados do Neovim antigos instalados, é altamente recomendável fazer um backup seguro para evitar conflitos de cache ou de arquivos:

```bash
# Backup das pastas de configuração, dados, estado e cache
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null || true
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null || true
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null || true
```

### Passo 2: Clonar a Configuração
Clone este repositório exatamente na pasta `~/.config/nvim`:

```bash
git clone https://github.com/netolopes27/nvim.git ~/.config/nvim
```
*(Substitua a URL acima pela URL do seu repositório pessoal caso tenha feito um fork).*

### Passo 3: Iniciar o Neovim
Inicie o Neovim no seu terminal:

```bash
nvim
```

Durante a primeira inicialização, uma tela especial do `lazy.nvim` será exibida mostrando o download e instalação automática de todos os **38 plugins** (versões fixadas pelo `lazy-lock.json`). Aguarde até que o processo termine e reinicie o Neovim.

### Passo 4: Aguardar o Mason instalar as ferramentas
Ao reabrir o Neovim, o **Mason** instala automaticamente em segundo plano tudo o que a configuração precisa:
- Servidores LSP: `lua_ls` e `pyright`
- Adaptador de debug: `codelldb`
- Formatadores e linter (via `mason-tool-installer`): `stylua`, `prettier`, `black` e `ruff`

Você pode acompanhar o progresso (e instalar outras ferramentas) abrindo a interface:

```vim
:Mason
```

### Passo 5: Verificação de Saúde
Por fim, execute o comando abaixo para verificar se o sistema encontrou todas as dependências e se os plugins estão corretos:

```vim
:checkhealth
```
Isso abrirá uma janela mostrando o status de todos os componentes da sua configuração. Se algo estiver faltando (como um executável de terminal), ela te indicará como resolver.

> [!TIP]
> Para o suporte completo a Rust (`rustaceanvim`, debug com `codelldb`), instale também a toolchain via [rustup](https://rustup.rs/) — o `rust-analyzer` vem junto com `rustup component add rust-analyzer`.

---

## 🔌 Estrutura de Plugins Ativos

A configuração soma **38 plugins** organizados de forma modular em **20 arquivos de especificação**. Cada arquivo dentro da pasta `lua/plugins/` agrupa um tema, o que torna super fácil ativar, desativar ou reconfigurar itens individualmente.

| Módulo / Plugin | Categoria | Descrição |
| :--- | :--- | :--- |
| [alpha.lua](lua/plugins/alpha.lua) | Dashboard | Tela inicial interativa e elegante (`alpha-nvim`). |
| [bufremove.lua](lua/plugins/bufremove.lua) | Edição QoL | Fecha buffers sem desmontar o layout de janelas (`mini.bufremove`). |
| [catppuccin.lua](lua/plugins/catppuccin.lua) | Tema Visual | Cores harmônicas e escuras no estilo Catppuccin Mocha. |
| [completions.lua](lua/plugins/completions.lua) | Autocomplete | Motor de completação `nvim-cmp`, snippets (LuaSnip), autopairs e tabout. |
| [conform.lua](lua/plugins/conform.lua) | Formatação | Formatação ao salvar e sob demanda com `conform.nvim` (`<leader>gf`). |
| [crates.lua](lua/plugins/crates.lua) | Rust Helper | Auxiliar visual para atualizar dependências no `Cargo.toml`. |
| [dap.lua](lua/plugins/dap.lua) | Depuração (DAP) | Debugger interativo completo e interface de depuração DAP UI. |
| [gitsigns.lua](lua/plugins/gitsigns.lua) | Git Gutter | Indicadores visuais de alterações no arquivo na calha lateral. |
| [lazygit.lua](lua/plugins/lazygit.lua) | Git UI | Abre a incrível ferramenta LazyGit em um popup integrado. |
| [lint.lua](lua/plugins/lint.lua) | Linting | Diagnósticos extras com `nvim-lint` (`ruff` para Python). |
| [lsp.lua](lua/plugins/lsp.lua) | LSP Core | Mason + LSPs e instalação automática de ferramentas (`mason-tool-installer`). |
| [lualine.lua](lua/plugins/lualine.lua) | Statusline | Barra de status altamente personalizável na parte inferior. |
| [neo-tree.lua](lua/plugins/neo-tree.lua) | Explorador | Árvore de navegação de arquivos interativa à esquerda. |
| [rustaceanvim.lua](lua/plugins/rustaceanvim.lua) | Rust Integrado | Suporte estendido para desenvolvimento em Rust profissional. |
| [surround.lua](lua/plugins/surround.lua) | Edição QoL | Atalhos inteligentes para gerenciar aspas, parênteses e tags. |
| [telescope.lua](lua/plugins/telescope.lua) | Fuzzy Finder | Buscador global de arquivos, símbolos e textos, acelerado por `fzf-native`. |
| [todo-comments.lua](lua/plugins/todo-comments.lua) | Comentários | Destaca e lista tags como `TODO`, `FIXME` e `BUG` no código. |
| [treesitter.lua](lua/plugins/treesitter.lua) | Syntax Parser | Highlight de sintaxe semântico avançado e indentação lógica. |
| [trouble.lua](lua/plugins/trouble.lua) | Diagnósticos | Painel inferior agregador de erros, avisos e tags do LSP. |
| [which-key.lua](lua/plugins/which-key.lua) | Ajuda Teclado | Guia visual popup de atalhos sugeridos ao apertar a tecla líder. |

---

## 📂 Estrutura de Diretórios

A estrutura da configuração segue estritamente os padrões modernos da comunidade do Neovim, garantindo clareza total:

```
~/.config/nvim/
├── KEYMAPS.md           # Referência completa e categorizada de atalhos
├── CLAUDE.md            # Notas e diretrizes para agentes de IA (Claude Code)
├── init.lua             # Entrada principal e inicialização do lazy.nvim
├── lazy-lock.json       # Commits de versões fixados (garante reprodutibilidade)
└── lua/
    ├── options.lua      # Configurações globais do Vim e atalhos sem plugins
    └── plugins/         # Diretório com arquivos individuais para cada plugin
```

---

## ⌨️ Atalhos Essenciais (Quickstart)

A tecla **`Leader`** desta configuração está mapeada para a tecla **`Espaço`**.
Abaixo estão listados os atalhos de maior utilidade no dia a dia. Para consultar a lista exaustiva e categorizada de comandos, consulte o arquivo [KEYMAPS.md](KEYMAPS.md). Você também pode apertar `<Espaço>` e aguardar o popup do `which-key` com as continuações disponíveis.

### 🔍 Navegação & Busca (Telescope / Neo-tree)
*   `<C-n>` — Abre / Fecha o explorador de arquivos lateral (`Neo-tree`).
*   `<leader>ff` — Procura arquivos pelo nome no projeto atual.
*   `<leader>fg` — Procura um texto específico dentro dos arquivos do projeto (live grep).
*   `<leader>fr` — Mostra o histórico de arquivos abertos recentemente.
*   `<leader>fb` — Lista todos os buffers de arquivos ativos em memória.
*   `<leader>ft` — Encontra todas as tags `TODO`, `FIXME` e `BUG` no projeto.

### 💻 Edição de Código & LSP
*   `K` — Mostra informações detalhadas da documentação do item sob o cursor (Hover).
*   `gd` — Salta diretamente para a definição do símbolo sob o cursor.
*   `gr` — Lista todas as referências do símbolo sob o cursor no projeto.
*   `<leader>ca` — Abre o menu de **Code Actions** (Correções sugeridas pelo LSP).
*   `<leader>rn` — Renomeia o símbolo sob o cursor de forma inteligente em todo o projeto.
*   `<leader>gf` — Formata o código do arquivo atual (conforme as regras do `conform.nvim`).
*   Salvar (`<leader>w` ou `:w`) já formata automaticamente — desative com `:FormatDisable` (global) ou `:FormatDisable!` (só o buffer atual) e reative com `:FormatEnable`.

### 📦 Controle de Versão Git (LazyGit / Gitsigns)
*   `<leader>gg` — Abre o console completo do `LazyGit` flutuante na tela.
*   `]c` / `[c` — Salta para a alteração (hunk) seguinte / anterior do git no arquivo atual.
*   `<leader>hs` — Faz o staging da alteração local sob o cursor.
*   `<leader>hp` — Mostra o preview flutuante da alteração sob o cursor.

### 🐛 Depuração (DAP)
*   `<leader>du` — Abre / fecha a interface gráfica de debug (`DAP UI`).
*   `<leader>dt` — Insere ou remove um Breakpoint na linha atual.
*   `<leader>dc` — Inicia ou continua a execução da depuração.

---

## 🧹 Manutenção e Boas Práticas

Esta configuração foi desenhada para ser de baixíssima manutenção, mas aqui estão algumas dicas úteis de conservação:

### Atualizando Plugins e LSPs
Para atualizar os seus plugins para a versão estável mais recente (usando os commits salvos no `lazy-lock.json` ou baixando novidades):
1. Digite `:Lazy` dentro do Neovim.
2. Pressione `U` para buscar atualizações e `S` para sincronizar.
3. Faça commit do `lazy-lock.json` atualizado para manter a reprodutibilidade.
4. Para ferramentas do Mason (como novos LSPs), digite `:Mason` e atualize-as pela interface interativa usando `u`.

### Adicionando Novos Plugins
Para adicionar um novo plugin na sua rotina:
1. Vá até a pasta `lua/plugins/`.
2. Crie um novo arquivo de especificação Lua, ex: `meu_plugin.lua`.
3. Retorne uma tabela com as configurações exigidas pelo `lazy.nvim`.
4. Abra o Neovim e o `lazy.nvim` detectará o novo arquivo e o instalará de forma automática!

### Mantendo o Código Formatado
A formatação ao salvar (`conform.nvim`) já cuida disso automaticamente. Se preferir formatar todos os arquivos Lua da configuração de uma vez pelo terminal:
```bash
# Executa o stylua na raiz da configuração
stylua .
```
*(O `stylua` é instalado pelo Mason em `~/.local/share/nvim/mason/bin/` — adicione esse diretório ao `PATH` se quiser usá-lo fora do Neovim.)*
