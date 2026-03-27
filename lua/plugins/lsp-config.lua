return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
            diagnostics = {
              disable = { "incomplete-signature-doc", "trailing-space" },
              unusedLocalExclude = { "_*" },
            },
            format = { enable = false },
          },
        },
      })

      lspconfig.rust_analyzer.setup({})
      lspconfig.clangd.setup({})
    end,
  },
}
