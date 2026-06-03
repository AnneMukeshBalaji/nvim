return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.views = opts.views or {}
    opts.views.cmdline_popup = {
      win_options = {
        winblend = 100,
      },
    }
    opts.views.popup = {
      win_options = {
        winblend = 100,
      },
    }
    return opts
  end,
}
