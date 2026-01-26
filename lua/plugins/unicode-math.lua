return {
  {
    "atomashevic/unicode-math.nvim",
    config = function()
      require("unicode-math").setup({
        renderer = "unicode",           -- Backend to use ("unicode" or "katex")
        auto_render = true,            -- Enable automatic rendering
        update_delay = 0,            -- Delay in ms before rendering (0 = immediate)
        filetypes = { "markdown", "tex", "text" },    -- File types to enable auto-rendering
      })
    end,
    ft = { "markdown", "tex" },  -- Load only for specific filetypes
  }
}
