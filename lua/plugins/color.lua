return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			local themes = {
				{ name = "mono-dark", lualine = "auto" },
				{ name = "mono-light", lualine = "auto" },
			}

			local current = 1

			local function apply_theme(theme)
				vim.cmd("colorscheme " .. theme.name)

				local ok = pcall(function()
					require("lualine").setup({
						options = { theme = theme.lualine },
					})
				end)
				if not ok then
					pcall(function()
						require("lualine").setup({ options = { theme = "auto" } })
					end)
				end

				vim.notify("colorscheme: " .. theme.name)
			end

			_G.MonoCycle = function()
				current = (current % #themes) + 1
				apply_theme(themes[current])
			end

			apply_theme(themes[current])

			vim.keymap.set("n", "<leader>tt", _G.MonoCycle, { desc = "cycle colorscheme" })

			return {}
		end,
	},
}
