return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    })

    -- git
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#6f6f6f" })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified",  { fg = "#85857a" })
    vim.api.nvim_set_hl(0, "NeoTreeGitAdded",     { fg = "#7a857a" })
    vim.api.nvim_set_hl(0, "NeoTreeGitDeleted",   { fg = "#857a7a" })

    -- diagnostics
    vim.api.nvim_set_hl(0, "NeoTreeDiagnosticError", { fg = "#8a7a7a" })
    vim.api.nvim_set_hl(0, "NeoTreeDiagnosticWarn",  { fg = "#8a8a7a" })
    vim.api.nvim_set_hl(0, "NeoTreeDiagnosticInfo",  { fg = "#7a828a" })
    vim.api.nvim_set_hl(0, "NeoTreeDiagnosticHint",  { fg = "#6a6a6a" })

    vim.keymap.set("n", "<C-z>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end,
}
