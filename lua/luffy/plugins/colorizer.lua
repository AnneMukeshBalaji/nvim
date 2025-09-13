return {
	"norcalli/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			"*", -- enable for all filetypes
		}, { names = false }) -- don’t highlight CSS names like "red"
	end,
}
