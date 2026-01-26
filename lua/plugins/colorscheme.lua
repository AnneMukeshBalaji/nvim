return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("kanagawa").setup({
        theme = "wave",

        transparent = true,

        styles = {
          comment = { italic = false },
          keyword = { bold = true },
        },

        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
                bg_float = "none",
                bg_sidebar = "none",
                bg_statusline = "none",
              },
            },
          },
        },

        overrides = function(colors)
          return {
            ------------------------------------------------------------------
            -- FULL TRANSPARENCY CORE
            ------------------------------------------------------------------
            Normal = { bg = "none" },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            SignColumn = { bg = "none" },
            EndOfBuffer = { bg = "none" },

            LineNr = { bg = "none" },
            CursorLineNr = { bg = "none" },

            StatusLine = { bg = "none" },
            StatusLineNC = { bg = "none" },
            WinBar = { bg = "none" },
            WinBarNC = { bg = "none" },

            ------------------------------------------------------------------
            -- VISUAL SELECTION MUST NOT BE TRANSPARENT
            ------------------------------------------------------------------
            Visual = { bg = colors.palette.waveBlue1 },
            VisualNOS = { bg = colors.palette.waveBlue1 },

            ------------------------------------------------------------------
            -- CURSOR LINE (OPTIONAL BUT RECOMMENDED)
            ------------------------------------------------------------------
            CursorLine = { bg = colors.palette.sumiInk3 },

            ------------------------------------------------------------------
            -- POPUP MENU
            ------------------------------------------------------------------
            Pmenu = { bg = "none" },
            PmenuSel = { bg = colors.palette.sumiInk4 },
            PmenuBorder = { bg = "none" },

            ------------------------------------------------------------------
            -- TELESCOPE
            ------------------------------------------------------------------
            TelescopeNormal = { bg = "none" },
            TelescopeBorder = { bg = "none" },
            TelescopePromptNormal = { bg = "none" },

            ------------------------------------------------------------------
            -- FILE TREE
            ------------------------------------------------------------------
            NvimTreeNormal = { bg = "none" },
            NeoTreeNormal = { bg = "none" },
            NeoTreeNormalNC = { bg = "none" },

            ------------------------------------------------------------------
            -- WHICHKEY
            ------------------------------------------------------------------
            WhichKeyFloat = { bg = "none" },
          }
        end,
      })

      vim.cmd.colorscheme("kanagawa")

      -- Hard-enforce transparency after colorscheme loads
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
