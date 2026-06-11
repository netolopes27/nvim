return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local status_ts, ts = pcall(require, "nvim-treesitter")
    if not status_ts then
      return
    end

    ts.setup()

    local status_config, config = pcall(require, "nvim-treesitter.config")
    if status_config and config.get_installed then
      local ensure_installed = {
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      }
      local installed = config.get_installed()
      local to_install = vim.tbl_filter(function(parser)
        return not vim.tbl_contains(installed, parser)
      end, ensure_installed)

      if #to_install > 0 then
        ts.install(to_install)
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    else
      local status_legacy, configs_legacy = pcall(require, "nvim-treesitter.configs")
      if status_legacy then
        configs_legacy.setup({
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    end
  end,
}
