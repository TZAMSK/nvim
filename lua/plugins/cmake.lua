return {
  {
    "Civitasv/cmake-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "akinsho/toggleterm.nvim",
    },

    cmd = {
      "CMakeGenerate",
      "CMakeBuild",
      "CMakeDebug",
      "CMakeSelectBuildTarget",
      "CMakeSelectLaunchTarget",
    },

    keys = {
      { "<leader>g", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
      { "<leader>b", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
      { "<leader>d", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
      { "<leader>l", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Select launch target" },

      -- Space+t = build and run selected launch target
      --[[{
        "<leader>t",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local cmake = require("cmake-tools")

          local target = cmake.get_launch_target_path()
          local args = cmake.get_launch_args() or ""

          if not target or target == "" then
            vim.notify("No launch target selected. Run :CMakeSelectLaunchTarget first.", vim.log.levels.ERROR)
            return
          end

          local cmd = string.format(
            "bash -lc 'cmake --build build && %q %s'",
            target,
            args
          )

          local term = Terminal:new({
            cmd = cmd,
            dir = vim.loop.cwd(),
            direction = "float",
            close_on_exit = false,
            hidden = true,
          })

          term:toggle()
        end,
        desc = "Build and run launch target",
      },
            ]]

      -- Space+r = run selected launch target only
      {
        "<leader>r",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local cmake = require("cmake-tools")

          local target = cmake.get_launch_target_path()
          local args = cmake.get_launch_args() or ""

          if not target or target == "" then
            vim.notify("No launch target selected. Run :CMakeSelectLaunchTarget first.", vim.log.levels.ERROR)
            return
          end

          local cmd = string.format(
            "bash -lc '%q %s'",
            target,
            args
          )

          local term = Terminal:new({
            cmd = cmd,
            dir = vim.loop.cwd(),
            direction = "float",
            close_on_exit = false,
            hidden = true,
          })

          term:toggle()
        end,
        desc = "Run launch target",
      },
    },

    opts = {
      cmake_build_directory = "build",
      cmake_generate_options = {
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
      },
      cmake_soft_link_compile_commands = true,
      cmake_compile_commands_from_lsp = true,
      cmake_generator = "Ninja",

      cmake_executor = {
        name = "quickfix",
        default_opts = {
          quickfix = {
            show = "always",
            position = "belowright",
            size = 10,
            encoding = "utf-8",
            auto_close_when_success = true,
          },
        },
      },
    },
  },
}
