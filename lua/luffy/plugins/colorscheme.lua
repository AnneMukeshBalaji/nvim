return {

  -- 🧛 OneDark Theme
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = false,
    priority = 1000,
    opts = {
      style = "deep", -- Options: dark, darker, cool, deep, warm, warmer, light
      transparent = true,
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },

}

