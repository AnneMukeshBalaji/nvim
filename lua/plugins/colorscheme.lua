return {
  -- {
  --   "EdenEast/nightfox.nvim",
  --   opts = {
  --     options = {
  --       transparent = true,
  --       style = "nightfox", -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
  --     },
  --   },
  -- },
  {
    {
      "craftzdog/solarized-osaka.nvim",
      lazy = false,
      priority = 1000,
      opts = function()
        return {
          transparent = true,
          lualine_bold = true,
          styles = {
            comments = { italic = true, bold = true },
            keywords = { italic = true },
            functions = { italic = true },
            sidebars = "transparent",
            floats = "transparent",
          },
        }
      end,
    },
  },
}
