return {
  'goolord/alpha-nvim',
  event = 'VimEnter', -- load plugin after all configuration is set
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local telescope = require('telescope.builtin')

  dashboard.section.header.val = {}






    _Gopts = {
      position = 'center',
      hl = 'Type',
      -- wrap = "overflow";
    }

    -- Define the path to the plugins folder dynamically
    local plugins_path = vim.fn.stdpath('config') .. '/lua/plugins'

    -- Set menu
    dashboard.section.buttons.val = {
      -- dashboard.button("SPC j", "󰈚   Restore Session", ":SessionRestore<cr>"),
      dashboard.button('e', '   New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '   Find file', ':Telescope find_files<CR>'),
      dashboard.button('s', '󰦛   Restore', ":lua require('persistence').load() <cr>"),
      dashboard.button('g', '󰱼   Find word', ':Telescope live_grep<CR>'),
      dashboard.button('r', '  Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('c', '   Plugins', ':Telescope find_files cwd=' .. plugins_path .. '<CR>'),
      dashboard.button('m', '󱌣   Mason', ':Mason<CR>'),
      dashboard.button('l', '󰒲   Lazy', ':Lazy<CR>'),
      dashboard.button('u', '󰂖   Update plugins', "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button('q', '   Quit NVIM', ':qa<CR>'),
    }

    local function footer()
      return 'Mogee'
    end
    dashboard.section.footer.val = footer()

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "Normal"
      button.opts.hl_shortcut = "Function"
      button.opts.position = "center"
      button.opts.width = 50
    end
    dashboard.section.header.opts.hl = "Special"
    dashboard.section.footer.opts.hl = "Special"
    dashboard.opts.layout[1].val = 8
    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'LazyVimStarted',
      callback = function()
        -- Get the current date and time

        -- Get the current hour
        local current_hour = tonumber(os.date '%H')

        -- Define the greeting variable
        local greeting

        if current_hour < 5 then
          greeting = '    Good night!'
        elseif current_hour < 12 then
          greeting = '  󰼰 Good morning!'
        elseif current_hour < 17 then
          greeting = '    Good afternoon!'
        elseif current_hour < 20 then
          greeting = '  󰖝  Good evening!'
        else
          greeting = '  󰖔  Good night!'
        end

        local stats = require("lazy").stats()
        local count = (math.floor(stats.startuptime * 100) / 100)
        dashboard.section.footer.val = {
          "󱐌 " .. stats.count .. " plugins loaded in " .. count .. " ms",
          " ",
          "      " .. greeting,
        }

        pcall(vim.cmd.AlphaRedraw)
      end,

    })
  end,
}
