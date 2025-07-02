return{
  "gen740/smoothcursor.nvim",
  event = "VeryLazy",
  config = function()
    require("smoothcursor").setup({
      type = "matrix", -- or "exp" | "matrix" | "railgun" | "pixiedust"
      cursor = "Ʃ",     -- Cursor shape (requires Nerd Font)
      texthl = "SmoothCursor", -- Highlight group
      linehl = nil, -- Optional line highlight
      fancy = {
        enable = true, -- Enable fancy mode
        head = { cursor = "󰀫", texthl = "SmoothCursor", linehl = nil },
        body = {
          { cursor = "󰀬", texthl = "SmoothCursorRed" },
          { cursor = "󰀬", texthl = "SmoothCursorOrange" },
          { cursor = "●", texthl = "SmoothCursorYellow" },
          { cursor = "•", texthl = "SmoothCursorGreen" },
          { cursor = ".", texthl = "SmoothCursorAqua" },
          { cursor = ".", texthl = "SmoothCursorBlue" },
          { cursor = ".", texthl = "SmoothCursorPurple" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" },
      },
      flyin_effect = nil,
      speed = 25,
      intervals = 35,
      priority = 10,
      timeout = 3000,
      threshold = 3,
      disable_float_win = false,
      enabled = true,
    })
  end,
}

