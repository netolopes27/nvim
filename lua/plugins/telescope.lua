return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      telescope.load_extension("ui-select")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
      vim.keymap.set(
        "n",
        "<leader>f/",
        builtin.current_buffer_fuzzy_find,
        { desc = "Fuzzy find in buffer" }
      )
      vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
      vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "Git files" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
      vim.keymap.set(
        "n",
        "<leader>fws",
        builtin.lsp_dynamic_workspace_symbols,
        { desc = "Workspace symbols" }
      )
    end,
  },
}
