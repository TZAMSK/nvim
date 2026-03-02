return {
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
      "mfd-paper",
      "mfd-flir",
    }

    local current = 1
    vim.cmd("colorscheme " .. themes[current])
    require("mfd").enable_cursor_sync()

    vim.keymap.set("n", "<leader>tt", function()
      current = (current % #themes) + 1
      local theme = themes[current]
      vim.cmd("colorscheme " .. theme)
      require("mfd").enable_cursor_sync()
      require("lualine").setup({ options = { theme = theme } })
      vim.notify("colorscheme: " .. theme)
    end, { desc = "cycle colorscheme" })

  end,
}