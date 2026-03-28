return {
  {
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
      require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },

          mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),

            ["<Up>"] = cmp.mapping(function(fallback)
              fallback()
            end, { "i", "s" }),

            ["<Down>"] = cmp.mapping(function(fallback)
              fallback()
            end, { "i", "s" }),
          }),

          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
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
                emoji = "emoji",
              })[entry.source.name]
              return item
            end,
          },

          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "nvim_lua" },
          }, {
            { name = "buffer" },
            { name = "emoji" },
          }),
        })
    end,
  },
}
