return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- or latte, frappe, macchiato, mocha
        transparent_background = true, -- ✅ Transparent background
        no_italic = true, -- ✅ No italics
        styles = {
          comments = { "bold" }, -- ✅ Bold comments
        },
      })

      -- Apply the colorscheme
      vim.cmd.colorscheme("catppuccin")

      -- Force transparency for extra UI bits
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" }) -- Completion popup
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })

      -- Optional: nvim-notify fallback background (matches Catppuccin Mocha base)
      require("notify").setup({
        background_colour = "#1e1e2e",
      })
    end,
  },
}

