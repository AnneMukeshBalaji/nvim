-- disable netrw to let nvim-tree hijack directory views
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.wrap = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- If you are using neovide then uncomment the below code
-- if vim.g.neovide then
--   vim.o.guifont = "Maple Mono NF:h12"
--   vim.g.neovide_opacity = 0.7
-- end
