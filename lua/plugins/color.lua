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
        variables = true,
      },
     overrides = {
  -- Neo-tree backgrounds adapted to Gruvbox
  NeoTreeNormal = { bg = "#32302f" },     -- Gruvbox dark background (medium)
  NeoTreeNormalNC = { bg = "#282828" },   -- Gruvbox darker background (non-focused)
  
  -- Notify background (a bit more subtle)
  NotifyBackground = { bg = "#1d2021" }, 

  -- CursorLine (softer highlight, but still visible)
  CursorLine = { bg = "#3c3836" },


  -- Main editor background (slightly darker than NeoTreeNormal)
  Normal = { bg = "#29292c" },
}
    })
    vim.cmd("colorscheme gruvbox")
  end,
}