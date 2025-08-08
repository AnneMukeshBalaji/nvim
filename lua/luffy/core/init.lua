require("luffy.core.options")
require("luffy.core.keymaps")

return {
  -- Existing plugins
  { "neovim/nvim-lspconfig" },
  { "nvim-treesitter/nvim-treesitter" },
  -- Add your Dart/Flutter plugins here 👇
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
      vim.g.lsc_enable_autocomplete = 2
    end,
  },
  {
    "natebosch/vim-lsc-dart",
    ft = { "dart" },
  },
}
