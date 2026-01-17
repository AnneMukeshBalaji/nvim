return {
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = true },
      picker = {
        sources = {
          explorer = {
            hidden = true, -- Show hidden files
            ignored = true, -- Show git-ignored files
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          -- Replace this header with your ASCII art
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
      -- Your other settings (picker, scroll, etc.)
      picker = { ... },
      scroll = { enabled = true },
    },
  },
  -- Your other plugins (Trouble, Todo, etc.) can stay here...
}
