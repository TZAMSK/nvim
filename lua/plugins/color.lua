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

    local themes = { "mfd-mono", "mfd-flir-bh" }

    local function apply_colors()
      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#8a7a7a" })
      vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = "#8a8a7a" })
      vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = "#7a828a" })
      vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = "#6a6a6a" })

      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#8a7a7a" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "#8a8a7a" })

      vim.api.nvim_set_hl(0, "CursorNormal", { bg = "#ffc0e0" })
      vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#ffffff" })
    end

    local current = 1

    local function apply_theme()
      local theme = themes[current]
      vim.cmd("colorscheme " .. theme)
      require("mfd").enable_cursor_sync()
      apply_colors()
      vim.notify("colorscheme: " .. theme)
    end

    apply_theme()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = apply_colors,
    })

    vim.keymap.set("n", "<leader>tt", function()
      current = (current % #themes) + 1
      apply_theme()
    end, { desc = "cycle mfd theme" })
  end,
}
