return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-x>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
    })

    -- Color the terminal background slightly per direction (optional)
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm*",
      callback = function()
        -- These map ANSI 256 colors used inside the terminal
        -- Error red  = color index 1, Warning yellow = color index 3
        vim.g.terminal_color_1  = "#ff4444"  -- red   (ANSI error)
        vim.g.terminal_color_3  = "#ffaa00"  -- yellow (ANSI warning)
        vim.g.terminal_color_9  = "#ff6666"  -- bright red
        vim.g.terminal_color_11 = "#ffd080"  -- bright yellow
      end,
    })
  end,
}