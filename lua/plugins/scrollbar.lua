return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  config = function()
    require("scrollbar").setup({
      show_in_active_only = true,
      handle = {
        blend = 0,
        text = " ",
        color = "#333333",
      },
      marks = {
        Search = { color = "#ffffff" },
        Error  = { color = "#8a7a7a" },
        Warn   = { color = "#8a8a7a" },
        Info   = { color = "#7a828a" },
        Hint   = { color = "#6a6a6a" },
        Misc   = { color = "#555555" },
        Cursor = { color = "#ffffff", text = " " },
      }
    })
  end,
}
