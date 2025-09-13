return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Same list as Mason
		local servers = {
			"clangd", -- C/C++
			"jdtls", -- Java
			"ts_ls", -- JS,TS,JSX,TSX
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

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				end,
			})
		end
	end,
}
