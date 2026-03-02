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
      "mfd-flir",
      "mfd-paper",
    }

    local current = 1
    vim.cmd("colorscheme " .. themes[current])
    require("mfd").enable_cursor_sync()

    -- Re-apply diagnostic colors after every colorscheme change
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        -- Diagnostic virtual text colors
        vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff4444", bold = true })
        vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#ffaa00", bold = true })
        vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#4499ff" })
        vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#aaaaaa" })

        -- Underline/undercurl colors
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#ff4444" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "#ffaa00" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { underline = true, sp = "#4499ff" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { underline = true, sp = "#aaaaaa" })

        -- Gutter sign column colors
        vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff4444", bold = true })
        vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = "#ffaa00", bold = true })
        vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { fg = "#4499ff" })
        vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = "#aaaaaa" })
      end,
    })

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