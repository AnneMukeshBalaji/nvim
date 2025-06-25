return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night", -- Options: "storm", "moon", "night", "day"
      transparent = true, -- Make background transparent
      terminal_colors = true,
      styles = {
        comments = { italic = false, bold = true, fg ='#00cc00' },
        keywords = { italic = false},
        functions = {italic = false},
        variables = {italic = false},
        sidebars = "transparent", -- also make sidebar (like NvimTree) transparent
        floats = "transparent", -- make floating windows transparent
      },
    })

    vim.cmd("colorscheme tokyonight")
    -- Make autocomplete popup (cmp, coc, etc.) transparent
    vim.cmd([[
      highlight Pmenu guibg=NONE
      highlight PmenuSel guibg=#283457 guifg=#ffffff
      highlight PmenuSbar guibg=NONE
      highlight PmenuThumb guibg=#3b4261
      ]])
  end,
}


