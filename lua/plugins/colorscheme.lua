return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      -- Setup the theme
      require("tokyonight").setup({
        style = "night",
        transparent = true, -- Enable global transparency
        styles = {
          comments = { italic = false },
          keywords = { bold = true },
          functions = {},
          variables = {},
          -- Set these to "transparent" to remove the dark backgrounds
          sidebars = "transparent",
          floats = "transparent",
        },
      })

      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
