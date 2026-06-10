return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
        float = {
          transparent = true,
          solid = true,
        },
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "bold" },
          loops = { "bold" },
          functions = { "bold" },
          keywords = { "italic" },
          strings = { "italic" },
          variables = { "bold" },
          booleans = { "bold" },
          properties = { "italic" },
        },
        custom_highlights = function(colors)
          return {

            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
            FloatTitle = { bg = "NONE" },

            TelescopeNormal = { bg = "NONE" },
            TelescopeBorder = { bg = "NONE" },
            TelescopePromptNormal = { bg = "NONE" },
            TelescopePromptBorder = { bg = "NONE" },
            TelescopeResultsNormal = { bg = "NONE" },
            TelescopeResultsBorder = { bg = "NONE" },
            TelescopePreviewNormal = { bg = "NONE" },
            TelescopePreviewBorder = { bg = "NONE" },

            Pmenu = { bg = "NONE" },
            PmenuSel = { bg = colors.surface0 },

            NvimTreeNormal = { bg = "NONE" },
            NvimTreeNormalNC = { bg = "NONE" },
            NeoTreeNormal = { bg = "NONE" },
            NeoTreeNormalNC = { bg = "NONE" },

            StatusLine = { bg = "NONE" },
            TabLine = { bg = "NONE" },
            TabLineFill = { bg = "NONE" },

            WhichKeyFloat = { bg = "NONE" },
            LazyNormal = { bg = "NONE" },
            MasonNormal = { bg = "NONE" },

            NotifyBackground = { bg = "NONE" },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
