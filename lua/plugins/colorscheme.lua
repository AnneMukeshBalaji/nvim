return {
  "bluz71/vim-moonfly-colors",
  name = "moonfly",
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.moonflyTransparent = true
    vim.g.moonflyItalics = false
    vim.g.moonflyCursorColor = true
    vim.g.moonflyTerminalColors = true
  end,
  config = function()
    vim.cmd.colorscheme("moonfly")
  end,
}
