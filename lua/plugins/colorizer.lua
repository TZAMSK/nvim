return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*",
      css = {
        rgb_fn = true,
        hsl_fn = true,
        css    = true,
        names  = true,
      },
      html = {
        names = true,
        mode  = "foreground",
      },
      lua  = { RRGGBB = true, names = false },
      conf = { RRGGBB = true, names = false },
    }, {
      RRGGBB  = true,   -- #RRGGBB hex codes everywhere
      rgb_fn  = true,   -- rgb() everywhere
      names   = true,  -- no false positives in code files
      mode    = "background",
    })
  end,
}