return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup {
        style = "darker",
        transparent = true,
        code_style = {
          comments = 'bold',
          keywords = 'none',
          functions = 'bold',
          strings = 'none',
          variables = 'none'
        }
      }
      require("onedark").load()
      -- EXTRA: make common UI groups fully transparent too
      vim.cmd [[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NormalNC guibg=NONE ctermbg=NONE
        highlight NormalFloat guibg=NONE ctermbg=NONE
        highlight FloatBorder guibg=NONE ctermbg=NONE
        highlight TelescopeNormal guibg=NONE ctermbg=NONE
        highlight TelescopeBorder guibg=NONE ctermbg=NONE
        highlight VertSplit guibg=NONE ctermbg=NONE
        highlight StatusLine guibg=NONE ctermbg=NONE
        highlight SignColumn guibg=NONE ctermbg=NONE
        highlight EndOfBuffer guibg=NONE ctermbg=NONE
        ]]
      -- ✅ Fix nvim-notify background fallback
      require("notify").setup({
        background_colour = "#1e1e2e", -- Replace with your real background!
      })
    end,
  },
}


