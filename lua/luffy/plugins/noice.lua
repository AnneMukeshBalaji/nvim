return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { icon = "" },
					search_down = { icon = " " },
					search_up = { icon = " " },
					lua = { icon = "" },
					help = { icon = "" },
				},
			},
			messages = {
				enabled = true,
				view = "notify", -- use nvim-notify
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
				view_search = "virtualtext",
			},
			popupmenu = {
				enabled = true,
				backend = "nui",
			},
			lsp = {
				progress = { enabled = true },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true, -- classic bottom search
				command_palette = true, -- cmdline + popupmenu together
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		})

		require("notify").setup({
			background_colour = "#000000", -- fully black
		})
		-- Optional: replace vim.notify with nvim-notify
		vim.notify = require("notify")
	end,
}
