return {

  -- 🌈 Catppuccin Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato",
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
            Comment      = { fg = colors.flamingo, bold = true },
          }
        end,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- 🐉 Kanagawa Theme
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    priority = 900,
    opts = {
      transparent = true,
      theme = "wave", -- wave, dragon, lotus
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
          Comment      = { fg = colors.palette.sumiInk4, bold = true },
        }
      end
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme("kanagawa")
    end
  },

  -- 🧛 OneDark Theme
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = true,
    priority = 900,
    opts = {
      style = "deep", -- dark, darker, cool, deep, warm, warmer, light
      transparent = true,
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },

  -- 🌃 TokyoNight Theme
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    priority = 900,
    opts = {
      style = "night", -- storm, moon, night, day
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
      },
      on_highlights = function(hl, c)
        hl.Normal       = { bg = "NONE" }
        hl.NormalNC     = { bg = "NONE" }
        hl.EndOfBuffer  = { bg = "NONE" }
        hl.SignColumn   = { bg = "NONE" }
        hl.LineNr       = { bg = "NONE" }
        hl.CursorLineNr = { bg = "NONE" }
        hl.StatusLine   = { bg = "NONE" }
        hl.StatusLineNC = { bg = "NONE" }
        hl.NormalFloat  = { bg = "NONE" }
        hl.Comment      = { fg = c.comment, italic = true }
      end
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end
  }

}

