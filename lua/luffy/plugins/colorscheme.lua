-- lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
      transparent_background = true,
      styles = {
        comments = { "bold" },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = {
          enabled = true,
        },
        notify = true,
        mini = true,
      },
      highlight_overrides = {
        all = function(colors)
          return {
            Normal       = { bg = "NONE" },
            NormalNC     = { bg = "NONE" },
            EndOfBuffer  = { bg = "NONE" },
            SignColumn   = { bg = "NONE" },
            LineNr       = { bg = "NONE" },
            CursorLineNr = { bg = "NONE" },
            WinSeparator = { bg = "NONE" },
            StatusLine   = { bg = "NONE" },
            StatusLineNC = { bg = "NONE" },
            NormalFloat  = { bg = "NONE" },
            Comment      = { fg = colors.overlay1, bold = true },
          }
        end,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

