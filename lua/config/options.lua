-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.wrap = true
vim.g.codeium_os = "Darwin"
vim.g.codeium_arch = "arm64"
vim.opt.foldmethod = "manual"
vim.g.lazyvim_check_order = false

if vim.g.neovide then
  vim.o.guifont = "Maple Mono NF:h12"
  vim.g.neovide_opacity = 0.7
end
