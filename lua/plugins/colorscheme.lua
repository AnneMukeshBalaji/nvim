return {
  {
    "ghifarit53/tokyonight-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.tokyonight_style = "storm"
      vim.g.tokyonight_enable_italic = 1
      vim.g.tokyonight_transparent_background = 1
    end,
  },
}
