local icons = require("helpers.icons")

return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			indent = {
				char = icons.ui.LineLeft,
				tab_char = icons.ui.LineLeft,
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
			},
			-- char = icons.ui.LineLeft,
			-- context_char = icons.ui.LineLeft,
			-- show_trailing_blankline_indent = false,
			-- use_treesitter = true,
			-- show_current_context = true,
		})
	end,
	main = "ibl",
}
