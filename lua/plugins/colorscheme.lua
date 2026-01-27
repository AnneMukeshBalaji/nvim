return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "night", -- storm | night | moon | day
      transparent = true, -- enable transparent background
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
