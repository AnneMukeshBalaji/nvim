-- Ensure Packer is installed
require('packer').startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- Colorschemes
	use 'folke/tokyonight.nvim'
	use 'joshdick/onedark.vim'
	use 'catppuccin/nvim'
	use 'altercation/vim-colors-solarized'
	use 'ellisonleao/gruvbox.nvim'

	use {
		"sainnhe/sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_style = "andromeda"
			vim.cmd.colorscheme("sonokai")
		end,
	}
	use 'HerringtonDarkholme/yats.vim'
	-- File Explorer
	use 'kyazdani42/nvim-tree.lua'
	-- folder icons
	use 'nvim-tree/nvim-web-devicons'
	-- Advanced Autocompletion plugin
	use {
		'neoclide/coc.nvim',
		branch = 'release',
		config = function()
			vim.g.coc_global_extensions = {
				'coc-html',     -- HTML support
				'coc-css',      -- CSS support
				'coc-tsserver', -- JavaScript/TypeScript support
				'coc-snippets'  -- Snippet support
			}
		end
	}

	-- fzf Plugin
	use {
		'junegunn/fzf.vim',
		requires = { 'junegunn/fzf' }, -- Make sure fzf is installed
		config = function()
			-- Optional: Customize fzf settings here
			vim.g.fzf_layout = { down = '40%' }
		end
	}

	-- Bufferline for buffer navigation
	use 'akinsho/bufferline.nvim'

	-- Terminal Plugin
	use 'akinsho/toggleterm.nvim'

	-- Custom Cyberdream plugin
	use { "scottmckendry/cyberdream.nvim" }

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- LSP and Autocompletion
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	-- Snippet plugins
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Mason (LSP Server management)
	use { "williamboman/mason.nvim" }

	-- Prettier for code formatting
	use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }

	-- Indent blankline plugin
	use "lukas-reineke/indent-blankline.nvim"

	-- Noice plugin (UI enhancements)
	use {
		'folke/noice.nvim',
		requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
	}

	-- Alpha-nvim (Dashboard)
	use 'goolord/alpha-nvim'

end)

-- Basic Neovim settings
vim.o.number = true            -- Show line numbers
vim.o.relativenumber = true    -- Show relative line numbers
vim.o.syntax = "on"            -- Enable syntax highlighting

-- Set Gruvbox colorscheme
vim.cmd'colorscheme sonokai'

-- NvimTree settings (file explorer)
require'nvim-tree'.setup {
	open_on_tab = true,            -- Open NvimTree automatically on tab
	hijack_netrw = true,           -- Disable netrw and use NvimTree instead
	view = {
		width = 33,                -- Set the width of the NvimTree window
		side = 'left',             -- Open NvimTree on the left side
	},
	renderer = {
		highlight_opened_files = "all",  -- Highlight opened files
		icons = {
			show = {
				file = true,            -- Show file icons
				folder = true,          -- Show folder icons
				folder_arrow = true,    -- Show folder arrows
			},
		},
	},
}

-- Set up nvim-cmp (Autocompletion)
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For vsnip users
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- Set up LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP servers for specified languages
local servers = {
	clangd = {}, -- C
	jdtls = {}, -- Java
	pyright = {}, -- Python
	html = {}, -- HTML
	cssls = {}, -- CSS
	ts_ls = {}, -- TypeScript and JavaScript (replacing tsserver)
	gopls = {}, -- Go
}

for server, config in pairs(servers) do
	require('lspconfig')[server].setup {
		capabilities = capabilities,
		settings = config.settings,
	}
end

-- Bufferline settings (buffer navigation)
require'bufferline'.setup {
	options = {
		numbers = "none",
		close_command = "bdelete! %",
		right_mouse_command = "bdelete! %",
		indicator = {
			style = "icon",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_tab_indicators = true,
		show_duplicates = true,
	}
}

-- Terminal configuration
require("toggleterm").setup{
	size = 20,
	open_mapping = [[<C-j>]],
	direction = 'horizontal',
}

-- Lualine configuration
require('lualine').setup {
	options = {
		theme = 'cyberdream',  -- Use the Cyberdream theme
	},
}

-- Mason setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

-- Prettier configuration
vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#exec_cmd_path'] = "prettier"
vim.g['prettier#config#tab_width'] = 2
vim.g['prettier#config#single_quote'] = true

-- Noice setup
require("noice").setup({
	lsp = {
		signature = {
			enabled = true, -- Enable LSP signature help in a floating window
		},
		hover = {
			enabled = true, -- Enable LSP hover content in a floating window
		},
	},
	popup = {
		size = {
			width = 80,
			height = 20,
		},
	},
})

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
	ensure_installed = {"c", "java", "css", "javascript", "typescript", "json"},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

-- Indent-blankline setup
require("ibl").setup()

-- Alpha-nvim Dashboard configuration
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Set a custom header (ASCII Art, or any text you like)
dashboard.section.header.val = {
	"           _                         _",
	"       _==/          i     i          \\==",
	"     /XX/            |\\___/|            \\XX\\",
	"   /XXXX\\            |XXXXX|            /XXXX\\",
	"  |XXXXXX\\_         _XXXXXXX_         _/XXXXXX|",
	" XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX",
	"|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|",
	"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
	"|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|",
	" XXXXXX/^^^^\"\\XXXXXXXXXXXXXXXXXXXXX/^^^^^\\XXXXXX",
	"  |XXX|       \\XXX/^^\\XXXXX/^^\\XXX/       |XXX|",
	"    \\XX\\       \\X/    \\XXX/    \\X/       /XX/",
	"       \"\\       \"      \\X/      \"       /\"",
}

-- Set a custom footer
dashboard.section.footer.val = { "Truly a selfless man. The best kind. Helped others Unconditionally." }

-- Set the buttons (actions in the dashboard)
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recently Used Files", ":Telescope oldfiles<CR>"),
	dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Footer setup
alpha.setup(dashboard.config)

-- Remove tildes from empty lines
vim.opt.fillchars:append({ eob = " " })

-- Noice configuration
require("noice").setup({
	highlights = {
		normal = { fg = "#ffffff", bg = "#282828" }, -- Text color and background
		info = { fg = "#00ff00", bg = "#282828" },   -- Info message color
		warn = { fg = "#ffcc00", bg = "#282828" },   -- Warning message color
		error = { fg = "#ff0000", bg = "#282828" },  -- Error message color
	}
})

-- Ensure vim-vsnip loads your custom snippets on Windows
vim.g.vsnip_snippet_dir = vim.fn.expand('~') .. '\\AppData\\Local\\nvim\\snippets'


-- Load keymaps from keymaps.lua
local keymaps_path = vim.fn.stdpath('config') .. (vim.fn.has('win32') == 1 and '\\keymaps.lua' or '/keymaps.lua')

if vim.fn.filereadable(keymaps_path) == 1 then
	dofile(keymaps_path)
else
	print("keymaps.lua not found!")
end

