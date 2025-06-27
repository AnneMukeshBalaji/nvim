return {
  {
    "craftzdog/solarized-osaka.nvim",
    name = "solarized-osaka",
    lazy = false,          
    priority = 1000,       
    opts = {
      ------------------------------------------------------------------
      -- 1. Core toggle
      ------------------------------------------------------------------
      transparent = true,      

      ------------------------------------------------------------------
      -- 2. Fine‑tune what should be see‑through 
      ------------------------------------------------------------------
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {italic = false },
        variables = {italic = false },
        sidebars = "transparent",   
        floats   = "transparent",   
      },

      ------------------------------------------------------------------
      -- 3. Turn off all italics
      ------------------------------------------------------------------
      disable_italics = true,

      ------------------------------------------------------------------
      -- 4. (Optional) wipe residual UI backgrounds + custom highlights
      ------------------------------------------------------------------
      on_highlights = function(hl, c)
        local none = "NONE"
        -- main editing area
        hl.Normal       = { bg = none }
        hl.NormalNC     = { bg = none }
        hl.EndOfBuffer  = { bg = none }
        -- line numbers & gutters
        hl.SignColumn   = { bg = none }
        hl.LineNr       = { bg = none }
        hl.CursorLineNr = { bg = none }
        -- splits / borders / statuslines
        hl.WinSeparator = { bg = none }
        hl.StatusLine   = { bg = none }
        hl.StatusLineNC = { bg = none }
        -- floating windows
        hl.NormalFloat  = { bg = none }
        -- comments: skyblue and bold, no italic
        hl.Comment = { fg = "#87CEEB", bold = true, italic = false }  -- SkyBlue
      end,
    },

    --------------------------------------------------------------------
    -- 5. Setup + apply the colourscheme
    --------------------------------------------------------------------
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}

