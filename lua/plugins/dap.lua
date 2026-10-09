return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "mason-org/mason.nvim",
    },

    keys = {
      { "<F5>",  function() require("dap").continue() end,          desc = "Debug: Continue" },
      { "<F10>", function() require("dap").step_over() end,         desc = "Debug: Step over" },
      { "<F11>", function() require("dap").step_into() end,         desc = "Debug: Step into" },
      { "<F12>", function() require("dap").step_out() end,          desc = "Debug: Step out" },
      { "<F9>",  function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle breakpoint" },
      {
        "<leader>B",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Debug: Conditional breakpoint",
      },
      { "<leader>u", function() require("dapui").toggle() end,  desc = "Debug: Toggle UI" },
      { "<leader>x", function() require("dap").terminate() end, desc = "Debug: Stop" },
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        automatic_installation = true,
        handlers = {},
      })

      dapui.setup()
      require("nvim-dap-virtual-text").setup({})

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
      vim.fn.sign_define("DapBreakpointRejected",  { text = "○", texthl = "DiagnosticHint" })
      vim.fn.sign_define("DapLogPoint",            { text = "◇", texthl = "DiagnosticInfo" })
      vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            local path = vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/build/sliyan_engine",
              "file"
            )
            if path == "" then
              return dap.ABORT
            end
            return path
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end,
  },
}
