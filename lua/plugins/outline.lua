return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup({
      outline_window = {
        position = "right",
        width = 20,
        show_symbol_details = true,
        show_symbol_lineno = true,
      },
      symbols = {
        icon_fetcher = function(kind)
          return false
        end,
      },
      keymaps = {
        -- Custom keymaps if needed
      },
    })

    vim.keymap.set("n", "<C-c>", function()
      if require("outline").is_open() then
        require("outline").focus_outline()
      else
        vim.cmd("Outline")
      end
    end, { desc = "Toggle/Focus Outline" })
  end,
}
