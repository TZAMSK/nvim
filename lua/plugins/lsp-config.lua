return {
  -- Mason core package manager
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },

  -- Mason LSP config integration
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "cssls", "html", "angularls", "rust_analyzer", "sqlls" },
      automatic_installation = true,
    },
  },

  -- LSP server setup
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua LSP
      lspconfig.lua_ls.setup({
        single_file_support = true,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            completion = { workspaceWord = true, callSnippet = "Both" },
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

      -- TypeScript / JavaScript LSP
      lspconfig.ts_ls.setup({
        root_dir = lspconfig.util.root_pattern(".git"),
        single_file_support = false,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- Other LSP servers
      local servers = { "cssls", "html", "angularls", "rust_analyzer", "sqlls" }
      for _, server in ipairs(servers) do
        if lspconfig[server] then
          lspconfig[server].setup({})
        else
          vim.notify("LSP server not installed: " .. server, vim.log.levels.WARN)
        end
      end
    end,
  },
}