return{
  "echasnovski/mini.animate",
  version = false, -- always use latest
  event = "VeryLazy",
  config = function()
    require('mini.animate').setup({
      -- Enable smooth scroll, resize, cursor, and open/close
      scroll = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 100, unit = 'total' }),
        subscroll = nil,
      },
      cursor = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 50, unit = 'step' }),
      },
      resize = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
      },
      open = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
      },
      close = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
      },
    })
  end,
}

