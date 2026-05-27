return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
██╗  ██╗███████╗██╗██╗         ██╗  ██╗██╗████████╗██╗     ███████╗██████╗ 
██║  ██║██╔════╝██║██║         ██║  ██║██║╚══██╔══╝██║     ██╔════╝██╔══██╗
███████║█████╗  ██║██║         ███████║██║   ██║   ██║     █████╗  ██████╔╝
██╔══██║██╔══╝  ██║██║         ██╔══██║██║   ██║   ██║     ██╔══╝  ██╔══██╗
██║  ██║███████╗██║███████╗    ██║  ██║██║   ██║   ███████╗███████╗██║  ██║
╚═╝  ╚═╝╚══════╝╚═╝╚══════╝    ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝
          ]],
        },
      },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      image = { enabled = true },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}
