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

      -- Run selected launch target (cross-platform safe)
      {
        "<leader>r",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local cmake = require("cmake-tools")

          local target = cmake.get_launch_target_path()
          local args = cmake.get_launch_args() or ""

          if not target or target == "" then
            vim.notify(
              "No launch target selected. Run :CMakeSelectLaunchTarget first.",
              vim.log.levels.ERROR
            )
            return
          end

          local is_windows = vim.loop.os_uname().sysname:match("Windows")

          -- Normalize executable path for Windows/Linux
          if is_windows then
            -- ensure .exe if missing (common CMake output case)
            if not target:match("%.exe$") then
              target = target .. ".exe"
            end
          else
            -- ensure executable is runnable on Linux
            target = "./" .. target:gsub("^./", "")
          end

          local cmd
          if is_windows then
            -- PowerShell-safe execution (no bash dependency)
            cmd = string.format('"%s" %s', target, args)
          else
            cmd = string.format("'%s' %s", target, args)
          end

          local term = Terminal:new({
            cmd = cmd,
            dir = vim.fn.getcwd(),
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

      -- Works on Linux + Windows (Ninja is widely supported)
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
