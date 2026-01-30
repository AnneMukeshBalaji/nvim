-- Bootstrap lazy.nvim, LazyVim and your plugins
vim.opt.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}
require("config.lazy")
require("config.keymaps")

vim.opt.swapfile = true
vim.opt.shortmess:append("A")
vim.opt.directory = vim.fn.stdpath("data") .. "/swap//"
