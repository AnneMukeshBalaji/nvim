
return {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = false, bold = true }, -- color set below
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
      sidebars = "transparent",
      floats = "transparent",
    },
    on_highlights = function(hl, c)
      hl.Comment = { fg = "#f0f5d6", bold = true, italic = false }
    end,
  },
  config = function(_, opts)
    vim.opt.termguicolors = true
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")

    -- Pmenu styling
    vim.api.nvim_set_hl(0, "Pmenu",      { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PmenuSel",   { bg = "#283457", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "PmenuSbar",  { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#3b4261" })
  end,
}
