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
      "i:block-CursorInsert",
    }

    local themes = {
      "mfd-paper",
      "mfd-flir",
    }

    local function apply_colors()
      -- Diagnostic underlines
      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff4444", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#ffaa00", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#aaaaaa" })

      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#ff4444" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "#ffaa00" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { underline = true, sp = "#aaaaaa" })

      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff4444", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = "#ffaa00", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = "#aaaaaa" })

      -- Cursor colors per mode
      vim.api.nvim_set_hl(0, "CursorNormal",  { bg = "#dedede" })  -- white  (normal)
      vim.api.nvim_set_hl(0, "CursorInsert",  { bg = "#000000" })  -- green  (insert)
    end

    local current = 1
    vim.cmd("colorscheme " .. themes[current])
    require("mfd").enable_cursor_sync()
    apply_colors()  -- apply on startup

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        apply_colors()  -- re-apply on theme switch
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
