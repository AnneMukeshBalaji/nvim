return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    theme = "onedark_dark", -- darker variant
    options = {
      transparency = true,
      terminal_colors = true,
      lualine_transparency = false,
      highlight_inactive_windows = false,
    },
    styles = {
      comments = "NONE",
      keywords = "italic",
      functions = "NONE",
      variables = "NONE",
      types = "NONE",
      numbers = "NONE",
      strings = "NONE",
      operators = "NONE",
    },
  },
  config = function(_, opts)
    require("onedarkpro").setup(opts)
    vim.cmd.colorscheme("onedark")
  end,
}
