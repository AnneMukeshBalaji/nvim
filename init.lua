require("luffy.core")
require("luffy.lazy")
-- vim.opt.shell = "/usr/bin/zsh" -- Or the correct path to your fish shell
vim.o.timeout = true
vim.o.timeoutlen = 200
vim.opt.wrap = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  command = "set filetype=html",
})
if vim.g.neovide then 
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  local alpha = function ()
    return string.format("%x",math.floor(255 * vim.g.transparency or 0.8)) 
  end

  vim.g.neovide_opacity = 0.7
  -- vim.g.transparency = 0.5
  vim.g.neovide_background_color = "#000000" .. alpha()
end
vim.g.clipboard = {
  name = "win32yank-wsl",
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

vim.cmd [[
  augroup ReactFiletypes
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascriptreact
  augroup END
]]

vim.cmd [[
  augroup ReactFiletypes
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascriptreact
  augroup END
]]


vim.filetype.add({
  extension = {
    js = "javascript",
    jsx = "javascriptreact",
    ts = "typescript",
    tsx = "typescriptreact",
    c = "c",
    cpp = "cpp",
    java = "java",
    py = "python",
    rs = "rust",
    dart = "dart",
    html = "html",
    css = "css",
  },
})


require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "cpp", "java", "python",
    "javascript", "typescript", "tsx",
    "dart", "html", "css", "lua", "json"
  },
  highlight = { enable = true },
  indent = { enable = true },
}
