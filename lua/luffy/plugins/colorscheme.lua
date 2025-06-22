return {
  -- Catppuccin Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      styles = {
        comments = { "bold" },
        functions = { "bold" },
        keywords = {},
        strings = {},
        variables = {},
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = { enabled = true },
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
            Comment      = { fg = colors.flamingo bold = true },
          }
        end,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin") -- Set Catppuccin as default
    end,
  },

  -- Kanagawa Theme
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    priority = 900,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        theme = "lotus", -- Options: "wave", "dragon", "lotus"
        overrides = function(colors)
          return {
            Normal       = { bg = "NONE" },
            NormalNC     = { bg = "NONE" },
            EndOfBuffer  = { bg = "NONE" },
            SignColumn   = { bg = "NONE" },
            LineNr       = { bg = "NONE" },
            CursorLineNr = { bg = "NONE" },
            StatusLine   = { bg = "NONE" },
            StatusLineNC = { bg = "NONE" },
            NormalFloat  = { bg = "NONE" },
          }
        end,
      })
    end,
  },
}

