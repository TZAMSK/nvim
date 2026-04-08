return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local root_dir = vim.fs.root(0, {
            ".git",
            "mvnw",
            "gradlew",
            "pom.xml",
            "build.gradle",
            "build.gradle.kts",
          })

          if not root_dir then
            root_dir = vim.fn.getcwd()
          end

          local project_name = vim.fn.fnamemodify(root_dir, ":t")
          local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

          require("jdtls").start_or_attach({
            cmd = {
              vim.fn.stdpath("data") .. "/mason/bin/jdtls",
              "-data",
              workspace_dir,
            },
            root_dir = root_dir,
            capabilities = capabilities,
            settings = {
              java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = "fernflower" },
              },
            },
            init_options = {
              bundles = {},
            },
          })
        end,
      })
    end,
  },
}
