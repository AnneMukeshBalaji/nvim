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
      words = {
        enabled = true,
        debounce = 200,
        notify_jump = false,
      },
      image = { enabled = false },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
      explorer = { enabled = true },
    },
    keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>E", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>fE", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>j", function() Snacks.terminal.toggle(nil, { win = { position = "float" } }) end, desc = "Toggle Terminal", mode = { "n", "t" } },
      { "]]", function() Snacks.words.jump(1, true) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-1, true) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
  },

  -- Disable LazyVim's built-in neo-tree (we use snacks explorer instead)
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}
