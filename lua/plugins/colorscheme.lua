return {
  "ellisonleao/gruvbox.nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      transparent = true,
    }
  end,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
    })
  end,
}
