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
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#8a7a7a" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "#8a8a7a" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { underline = true, sp = "#7a828a" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { underline = true, sp = "#6a6a6a" })
    end

    apply_colors()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = apply_colors,
    })
  end,
}
