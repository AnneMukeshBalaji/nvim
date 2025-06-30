return {
  {
    "gen740/SmoothCursor.nvim",
    lazy = false,
    config = function()
      require("smoothcursor").setup({
        type = "default", -- Or "exp" | "matrix" | "sonic" | "trail"
        cursor = "",     -- The cursor symbol
        texthl = "SmoothCursor", -- Highlight group
        linehl = nil,     -- Line highlight
        fancy = {
          enable = true,  -- Fancy mode enables extra tail effects
          head = { cursor = "", texthl = "SmoothCursor" },
          body = {
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "•", texthl = "SmoothCursorYellow" },
            { cursor = ".", texthl = "SmoothCursorRed" },
          },
          tail = nil,
        },
      })
    end,
  },
}

