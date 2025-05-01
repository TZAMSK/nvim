return {
  "romgrk/barbar.nvim",
  version = '^1.0.0', 
  dependencies = {
    'lewis6991/gitsigns.nvim', 
    'nvim-tree/nvim-web-devicons', 
  },
  config = function()
    require('lazy').setup {
      {
        'romgrk/barbar.nvim',
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
        },
      },
    }

local function close_first_buffer_if_needed()
      local buffers = vim.fn.len(vim.fn.getbufinfo({buflisted = 1}))
      if buffers > 5 then
        vim.cmd("BufferGoto 1")
        vim.cmd("BufferClose")
      end
    end

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = close_first_buffer_if_needed,
    })

    vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", {})
    vim.keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", {})
    vim.keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", {})
    vim.keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", {})
    vim.keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", {})
    vim.keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", {})
    vim.keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", {})
    vim.keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", {})
    vim.keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", {})

    vim.keymap.set("n", "<A-,>", ":BufferPrevious<CR>", {})
    vim.keymap.set("n", "<A-.>", ":BufferNext<CR>", {})
  end
}