return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local transparent = true -- enable transparency

		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = transparent,
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				which_key = true,
			},
		})

		-- Apply colorscheme
		vim.cmd.colorscheme("catppuccin")

		-- Extra highlight clear for full transparency
		vim.cmd([[
      hi Normal guibg=none
      hi NormalNC guibg=none
      hi NormalFloat guibg=none
      hi SignColumn guibg=none
      hi LineNr guibg=none
      hi EndOfBuffer guibg=none
    ]])
	end,
}
