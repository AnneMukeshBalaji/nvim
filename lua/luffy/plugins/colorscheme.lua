-- lua/plugins/colorscheme.lua  (or any file you source from your Lazy setup)
return {
  {
    "craftzdog/solarized-osaka.nvim",
    name = "solarized-osaka",
    lazy = false,          -- load at startup
    priority = 1000,       -- load before everything else
    opts = {
      ------------------------------------------------------------------
      -- 1. Core toggle
      ------------------------------------------------------------------
      transparent = true,      -- **master switch**: don’t set any bg

      ------------------------------------------------------------------
      -- 2. Fine‑tune what should be see‑through 
      ------------------------------------------------------------------
      styles = {
        sidebars = "transparent",   -- nvim-tree, qf, help…
        floats   = "transparent",   -- :lua print(vim.inspect()) pop‑ups
      },

      ------------------------------------------------------------------
      -- 3. (Optional) wipe residual UI backgrounds
      ------------------------------------------------------------------
      on_highlights = function(hl, c)
        local none = "NONE"   -- 👈 avoids the earlier “local transparent” bug
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
      end,
    },

    --------------------------------------------------------------------
    -- 4. Setup + apply the colourscheme
    --------------------------------------------------------------------
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}


