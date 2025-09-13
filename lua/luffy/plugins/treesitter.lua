return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"c", -- C
				"cpp", -- C++
				-- "cs", -- C#
				"java", -- Java
				"javascript", -- JS
				"typescript", -- TS
				"tsx", -- React TSX
				"html",
				"css",
				"scss", -- For TailwindCSS / CSS frameworks
				"json",
				"yaml",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"python",
				-- "dart", -- Flutter/Dart
				-- "dartdoc", -- Optional, if you want doc support
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		-- Use bash parser for zsh files
		vim.treesitter.language.register("bash", "zsh")
	end,
}
