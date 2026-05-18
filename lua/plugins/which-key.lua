return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 300,
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>h", group = "hunk (git)" },
      { "<leader>d", group = "debug/diagnostic" },
      { "<leader>g", group = "git/format" },
      { "<leader>c", group = "code" },
      { "<leader>s", group = "split" },
      { "<leader>b", group = "buffer" },
      { "<leader>r", group = "rename" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer local keymaps",
    },
  },
}
