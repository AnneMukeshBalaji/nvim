
return {
  {
    "dart-lang/dart-vim-plugin",
    ft = { "dart" },
  },
  {
    "thosakwe/vim-flutter",
    ft = { "dart" },
  },
  {
    "natebosch/vim-lsc",
    ft = { "dart" },
    config = function()
      vim.g.lsc_enable_autocomplete = 1
    end,
  },
  {
    "natebosch/vim-lsc-dart",
    ft = { "dart" },
  },
}
