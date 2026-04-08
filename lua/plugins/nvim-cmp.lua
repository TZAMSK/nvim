return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-emoji",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },

  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(), -- Move down
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- Move up
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),    -- Scroll up
        ["<C-d>"] = cmp.mapping.scroll_docs(4),     -- Scroll down
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered("rounded"),
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          require("tailwindcss-colorizer-cmp").formatter(entry, item)
          item.menu = ({
            buffer = "buf",
            nvim_lsp = "lsp",
            path = "path",
            nvim_lua = "api",
            luasnip = "snip",
          })[entry.source.name]
          return item
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "emoji" },
      }),
    })
  end,
}
