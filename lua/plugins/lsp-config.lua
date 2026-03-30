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
      ensure_installed = { 
          "lua_ls", 
          "rust_analyzer", 
          "clangd", 
          "jdtls", 
          "wgsl_analyzer", 
      },
      automatic_enable = false,
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
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

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=never",
        },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("clangd")
    end,
  },
}
