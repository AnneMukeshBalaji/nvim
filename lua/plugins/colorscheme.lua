return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = false },
      keywords = { bold = true },
      functions = { italic = true },
      variables = { italic = true },
      sidebars = "transparent",
      floats = "transparent",
    },
    sidebars = { "qf", "help" },
    dim_inactive = false,
    lualine_bold = false,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}
