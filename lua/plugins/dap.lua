return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
<<<<<<< HEAD
    "nvim-neotest/nvim-nio"
=======
    "nvim-neotest/nvim-nio",
>>>>>>> fd39648b56f784d64ce4ee7c0ee2d27a22aabd05
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "/usr/bin/lldb-vscode-14",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end,
}
