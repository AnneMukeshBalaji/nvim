-- lua/plugins/colorscheme.lua

return {
  -- Tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- Options: "storm", "moon", "night", "day"
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
      })

      -- Uncomment this to enable Tokyonight
      -- vim.cmd("colorscheme tokyonight")

      -- Make autocomplete popup (cmp, coc, etc.) transparent
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
      end,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)

      -- Uncomment this to enable Solarized Osaka
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}

