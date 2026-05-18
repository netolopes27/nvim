return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  ft = { "rust" },
  config = function()
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

    vim.g.rustaceanvim = {
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>k", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { buffer = bufnr, desc = "Rust hover actions" })
        end,
      },
      dap = {
        adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}
