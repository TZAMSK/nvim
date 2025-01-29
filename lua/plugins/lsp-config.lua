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
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities  --js
      })
      lspconfig.html.setup({
        capabilities = capabilities --html
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities --lua
      })
      lspconfig.cssls.setup({
        capabilities = capabilities --css
      })
      lspconfig.angularls.setup({
        capabilities = capabilities --angular
      })
      lspconfig.biome.setup({
        capabilities = capabilities --ts 
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities --rust
      })
      lspconfig.basedpyright.setup({
        capabilities = capabilities --python
      })
      lspconfig.sqlls.setup({
        capabilities = capabilities --sql
      })
      lspconfig.jdtls.setup({
        cmd = {'jdtls'},
        capabilities = capabilities
      })
      lspconfig.kotlin_language_server.setup({
        cmd = { "C:/Program Files/kotlin-language-server-1.3.12/server/build/install/server/bin/kotlin-language-server" },
        capabilities = capabilities --kotlin
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
