return {
  {
    "echasnovski/mini.animate",
    version = false,  -- Use latest commit
    lazy = false,     -- Load immediately (or you can set `event = "VeryLazy"` to defer)
    config = function()
      require('mini.animate').setup({
        -- Example: Enable cursor animation, scroll, and window resize
        cursor = {
          enable = true,
          timing = require('mini.animate').gen_timing.linear({ duration = 100, unit = 'total' }),
        },
        scroll = {
          enable = true,
          timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
        },
        resize = {
          enable = true,
          timing = require('mini.animate').gen_timing.linear({ duration = 200, unit = 'total' }),
        },
      })
    end,
  },
}

