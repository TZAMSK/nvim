return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        --lua
        null_ls.builtins.formatting.stylua,
        --js        
        null_ls.builtins.formatting.prettier,
        --python
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        --rust
        null_ls.builtins.formatting.rustftm,
        --html
        null_ls.builtins.formatting.htmlbeautifier,
        null_ls.builtins.completion.htmlhint,
        --css
        --js
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

