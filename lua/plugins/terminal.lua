return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-x>]],
      direction = "float",
      shade_terminals = true,
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm*",
      callback = function()
        vim.g.terminal_color_1  = "#8a7a7a"
        vim.g.terminal_color_2  = "#7a857a"
        vim.g.terminal_color_3  = "#8a8a7a"
        vim.g.terminal_color_4  = "#7a828a"

        vim.g.terminal_color_9  = "#9a8a8a"
        vim.g.terminal_color_10 = "#8a958a"
        vim.g.terminal_color_11 = "#9a9a8a"
        vim.g.terminal_color_12 = "#8a909a"
      end,
    })
  end,
}
