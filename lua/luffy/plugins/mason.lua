return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- List of all languages from your treesitter.lua
		local servers = {
			"clangd", -- C/C++
			"jdtls", -- Java
			"ts_ls", -- JS,TS,JSX,Node
			"html", -- HTML
			"cssls", -- CSS/SCSS
			"jsonls", -- JSON
			"yamlls", -- YAML
			"prismals", -- Prisma
			"marksman", -- Markdown
			"svelte", -- Svelte
			"graphql", -- GraphQL
			"bashls", -- Bash
			"lua_ls", -- Lua
			"vimls", -- Vimscript
			"dockerls", -- Docker
			"pyright", -- Python
			-- "dartls",        -- Dart/Flutter
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = true,
		})
	end,
}
