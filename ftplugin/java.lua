local ok_jdtls, jdtls = pcall(require, "jdtls")
if not ok_jdtls then
  return
end

local ok_setup, jdtls_setup = pcall(require, "jdtls.setup")
if not ok_setup then
  return
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "build.gradle.kts" }
local root_dir = jdtls_setup.find_root(root_markers)

if not root_dir or root_dir == "" then
  root_dir = vim.fn.getcwd()
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

local config = {
  cmd = {
    jdtls_bin,
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
    },
  },
  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
