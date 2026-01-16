return {
  {
    "folke/snacks.nvim",
    opts = {
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
  -- Your other plugins (Trouble, Todo, etc.) can stay here...
}
