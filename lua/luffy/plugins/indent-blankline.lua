return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "│" },
  },
  config = function(_, opts)
    -- 🔧 Define the missing highlight group
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#5eacd3" }) -- tweak color to match theme

    -- ✅ Now safe to call setup
    require("ibl").setup(opts)
  end,
}

