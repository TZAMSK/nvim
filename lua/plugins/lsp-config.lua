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
      "hrsh7th/cmp-nvim-lsp",  -- Make sure this is installed for capabilities
      "mfussenegger/nvim-jdtls"  -- Add jdtls as dependency here
    },
    config = function()
      vim.lsp.set_log_level("debug")  -- Temporarily enable for debugging

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        -- Java-specific keymaps
        if client.name == 'jdtls' then
          vim.keymap.set('n', '<leader>jo', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
          vim.keymap.set('n', '<leader>jr', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
          vim.keymap.set('n', '<leader>ji', vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
        end
      end

      local servers = {
        "html", "lua_ls", "cssls", "ts_ls", "angularls", 
        "rust_analyzer", "sqlls"
        -- Removed "jdtls" from here since we configure it separately below
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach
        })
      end

      -- JavaFX specific configuration for jdtls
      local javafx_path = "/usr/lib/jvm/java-24.0.2-openjfx/lib"
      local javafx_modules = "javafx.controls,javafx.fxml"
      
      lspconfig.jdtls.setup({
        cmd = {'jdtls'},
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern(
          '.git', 'gradlew', 'mvnw', 'pom.xml', 
          'build.gradle', 'build.gradle.kts', '.project'
        ),
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-24",
                  path = "/usr/lib/jvm/java-25-openjdk",
                }
              }
            },
            project = {
              referencedLibraries = {
                javafx_path .. "/*.jar",
                javafx_path .. "/javafx.base.jar",
                javafx_path .. "/javafx.controls.jar",
                javafx_path .. "/javafx.fxml.jar",
                javafx_path .. "/javafx.graphics.jar",
                javafx_path .. "/javafx.media.jar",
                javafx_path .. "/javafx.swing.jar",
                javafx_path .. "/javafx.web.jar"
              }
            },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.Assume.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.junit.jupiter.api.Assumptions.*",
                "org.junit.jupiter.api.DynamicContainer.*",
                "org.junit.jupiter.api.DynamicTest.*",
                "org.mockito.Mockito.*",
                "org.mockito.ArgumentMatchers.*",
                "org.mockito.Answers.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*"
              }
            }
          }
        },
        init_options = {
          bundles = {},
          extendedClientCapabilities = {
            progressReportProvider = true,
            classFileContentsSupport = true,
            generateToStringPromptSupport = true,
            hashCodeEqualsPromptSupport = true,
            advancedExtractRefactoringSupport = true,
            advancedOrganizeImportsSupport = true,
            generateConstructorsPromptSupport = true,
            generateDelegateMethodsPromptSupport = true,
            moveRefactoringSupport = true,
            overrideMethodsPromptSupport = true,
            inferSelectionSupport = { "extractMethod", "extractVariable", "extractConstant" },
          }
        }
      })
      
      -- Set JavaFX specific environment for Java files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          -- Set path to JavaFX modules for this buffer
          vim.b.javafx_path = javafx_path
          vim.b.javafx_modules = javafx_modules
        end
      })
    end,
  },
}
