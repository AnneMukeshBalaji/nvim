return {
  -- Disable Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- Enable and configure nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer NvimTree (root dir)" },
      { "<leader>E", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Explorer NvimTree (cwd)" },
    },
    opts = {
      hijack_netrw = true,
      git = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      renderer = {
        highlight_git = true,
        root_folder_label = false,
      },
    },
  },
}
