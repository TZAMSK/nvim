return {
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
        variables = false,
      },
      overrides = {
        -- Customize Neo-tree backgrounds with different colors
        NeoTreeNormal = { bg = "#4a3b3b" }, -- Background color for Neo-tree
        NeoTreeNormalNC = { bg = "#403c3c" }, -- Background color for Neo-tree when not focused

        -- Highlight NotifyBackground group if needed
        NotifyBackground = { bg = "#2e2e2e" }, -- Background color for notifications

        -- Customize CursorLine color
        CursorLine = { bg = "#5a4d4d" }, -- Change this to your desired color
      },
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
