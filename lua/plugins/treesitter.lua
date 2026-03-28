return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = false,
        },
      })
    end,
  },
}
