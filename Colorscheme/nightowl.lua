return {
  {
    "oxfist/night-owl.nvim",
    name = "night-owl",
    priority = 1000,
    lazy = false,
    config = function()
      require("night-owl").setup({
        transparent = true, -- ✅ Transparent background
        italics = false,    -- ✅ No italics
      })

      -- Apply the colorscheme
      vim.cmd.colorscheme("night-owl")

      -- Bold comments
      vim.api.nvim_set_hl(0, "Comment", { bold = true })

      -- Transparent various elements (just to be sure)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })         -- Completion popup

      -- nvim-notify fallback background
      require("notify").setup({
        background_colour = "#011627", -- Night Owl base
      })
    end,
  },
}

