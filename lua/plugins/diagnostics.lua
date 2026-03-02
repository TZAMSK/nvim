return {
  dir = vim.fn.stdpath("config"),
  name = "diagnostics-config",
  lazy = false,
  priority = 900,
  config = function()

    vim.diagnostic.config({
      virtual_text = false,
      signs = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    local function apply_colors()
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#ff4444" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "#ffaa00" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { underline = true, sp = "#4499ff" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { underline = true, sp = "#aaaaaa" })
    end

    apply_colors()

  end,
}