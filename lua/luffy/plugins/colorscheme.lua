-- lua/plugins/colorscheme.lua

-- Choose your colorscheme here: "tokyonight", "solarized-osaka", "gruvbox"
local colorscheme_name = "gruvbox"

return {
  -- Tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false, bold = true, fg = "#00cc00" },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = false },
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          hl.Comment = { fg = "#00cc00", italic = false, bold = true }
          hl.Function = { italic = false }
          hl.Keyword = { italic = false }
          hl.Type = { italic = false }
          hl.Variable = { italic = false }
          hl.Identifier = { italic = false }
        end,
      })

      if colorscheme_name == "tokyonight" then
        vim.cmd("colorscheme tokyonight")
      end

      vim.cmd([[
        highlight Pmenu guibg=NONE
        highlight PmenuSel guibg=#283457 guifg=#ffffff
        highlight PmenuSbar guibg=NONE
        highlight PmenuThumb guibg=#3b4261
      ]])
    end,
  },

  -- Solarized Osaka colorscheme
  {
    "craftzdog/solarized-osaka.nvim",
    name = "solarized-osaka",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        comments = { italic = false, bold = true, fg = "#00cc00" },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        local none = "NONE"
        hl.Normal       = { bg = none }
        hl.NormalNC     = { bg = none }
        hl.EndOfBuffer  = { bg = none }
        hl.SignColumn   = { bg = none }
        hl.LineNr       = { bg = none }
        hl.CursorLineNr = { bg = none }
        hl.WinSeparator = { bg = none }
        hl.StatusLine   = { bg = none }
        hl.StatusLineNC = { bg = none }
        hl.NormalFloat  = { bg = none }

        hl.Comment = { fg = "#00cc00", italic = false, bold = true }
        hl.Function = { italic = false }
        hl.Keyword = { italic = false }
        hl.Type = { italic = false }
        hl.Variable = { italic = false }
        hl.Identifier = { italic = false }
      end,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      if colorscheme_name == "solarized-osaka" then
        vim.cmd("colorscheme solarized-osaka")
      end
    end,
  },

  -- Gruvbox colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      transparent_mode = true,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      overrides = {
        Comment = { fg = "#00cc00", italic = false, bold = true },
        Function = { italic = false },
        Keyword = { italic = false },
        Type = { italic = false },
        Identifier = { italic = false },
      },
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      if colorscheme_name == "gruvbox" then
        vim.cmd("colorscheme gruvbox")
      end
    end,
  },
}

