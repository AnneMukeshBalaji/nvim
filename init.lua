require("luffy.core")
require("luffy.lazy")
vim.opt.shell = "/usr/bin/fish"  -- Or the correct path to your fish shell
vim.o.timeout = true
vim.o.timeoutlen = 200
vim.opt.wrap = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

