return {
	"hedyhli/outline.nvim",
	lazy = false,
	config = function()
		require("outline").setup({
			outline_window = {
				position = "right",
				width = 20,
				show_symbol_details = true,
				show_symbol_lineno = true,
				focus_on_open = false,
			},
			symbols = {
				icon_fetcher = function(kind)
					return false
				end,
			},
			keymaps = {},
		})

		-- Open Outline when a file is opened
		vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
			callback = function(args)
				if
					vim.bo[args.buf].buftype == ""
					and vim.api.nvim_buf_get_name(args.buf) ~= ""
					and not require("outline").is_open()
				then
					vim.schedule(function()
						vim.cmd("OutlineOpen")
					end)
				end
			end,
		})

		-- Toggle Outline
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", {
			desc = "Toggle Outline",
		})
	end,
}
