return {
	"Pocco81/auto-save.nvim",
	event = "BufReadPre",
	config = function()
		require("auto-save").setup({
			enabled = true,
			trigger_events = { "InsertLeave", "TextChanged" }, -- when to save
			execution_message = {
				message = function()
					return ""
				end, -- silence "AutoSave: saved" msg
			},
		})
	end,
}
