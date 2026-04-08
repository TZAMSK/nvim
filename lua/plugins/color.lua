return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        transparent_mode = false,
        contrast = "hard",
        italic = {
          comments = true,
          strings = false,
          keywords = false,
          functions = false,
          variables = true,
        },
        overrides = {
          NeoTreeNormal = { bg = "#32302f" },
          NeoTreeNormalNC = { bg = "#282828" },
          NotifyBackground = { bg = "#1d2021" },
          CursorLine = { bg = "#3c3836" },
          Normal = { bg = "#29292c" },
        },
      })
    end,
  },

  {
    "kungfusheep/mfd.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("mfd").setup({
        bright_comments = true,
      })

      vim.opt.guicursor = {
        "n:block-CursorNormal",
        "v:block-CursorVisual",
        "i:block-CursorInsert",
        "r-cr:block-CursorReplace",
        "c:block-CursorCommand",
      }

      local themes = {
        "gruvbox",
        "mfd-paper",
        "quiet",
      }

      local current = 1

      local function apply_theme(theme)
        vim.cmd("colorscheme " .. theme)

        if theme:match("^mfd") then
          require("mfd").enable_cursor_sync()
        end

        require("lualine").setup({
          options = { theme = theme },
        })

        vim.notify("colorscheme: " .. theme)
      end

      apply_theme(themes[current])

      vim.keymap.set("n", "<leader>tt", function()
        current = (current % #themes) + 1
        apply_theme(themes[current])
      end, { desc = "cycle colorscheme" })
    end,
  },
}
