return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,
  priority = 1005,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",             -- Use "hard" contrast
      transparent_mode = true,       -- Make background transparent
      terminal_colors = true,        -- Enable terminal colors
      italic = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
      },
      overrides = {
        Comment = { fg = "#deffaf", bold = true },
      },
    })

    require("notify").setup({
      background_colour = "#000005",
    })

    vim.cmd("colorscheme gruvbox")

    -- Make autocomplete popup transparent
    vim.cmd([[
      highlight Pmenu guibg=NONE
    ]])
  end,
}

