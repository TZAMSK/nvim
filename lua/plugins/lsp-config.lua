return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp"  -- Make sure this is installed for capabilities
    },
    config = function()
      vim.lsp.set_log_level("debug")  -- Temporarily enable for debugging

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
      end

      local servers = {
        "html", "lua_ls", "cssls", "ts_ls", "angularls", 
        "rust_analyzer", "sqlls", "jdtls"
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach
        })
      end

      lspconfig.jdtls.setup({
        cmd = {'jdtls'},
        capabilities = capabilities,
        on_attach = on_attach
      })

      lspconfig.kotlin_language_server.setup({
        cmd = { "C:/Program Files/kotlin-language-server-1.3.12/server/build/install/server/bin/kotlin-language-server" },
        capabilities = capabilities,
        on_attach = on_attach
      })
    end,
  },
}
