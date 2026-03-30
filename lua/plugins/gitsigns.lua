return {
  "lewis6991/gitsigns.nvim",
  commit = "39b5b6f",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "│" },
        topdelete    = { text = "│" },
        changedelete = { text = "│" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
    })

    vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = "#7a857a" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#85857a" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#857a7a" })
  end,
}
