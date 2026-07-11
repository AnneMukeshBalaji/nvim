return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIX = { icon = "", color = "error" },
      TODO = { icon = "", color = "info" },
      HACK = { icon = "", color = "warning" },
      NOTE = { icon = "", color = "hint" },
    },
  },
}
