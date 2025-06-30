return {
  {
    "oxfist/night-owl.nvim",
    name = "night-owl",
    priority = 1000,
    lazy = false,
    config = function()
      require("night-owl").setup({
        transparent_background = true,
      })

      vim.cmd.colorscheme("night-owl")

      -- Force transparency for extra UI bits
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })

      -- Remove italics for common known groups
      vim.api.nvim_set_hl(0, "Comment", { italic = false })
      vim.api.nvim_set_hl(0, "Keyword", { italic = false })
      vim.api.nvim_set_hl(0, "Type", { italic = false })
      vim.api.nvim_set_hl(0, "Function", { italic = false })
      vim.api.nvim_set_hl(0, "variable", { italic = false })
      vim.api.nvim_set_hl(0, "Identifier", { italic = false })
      vim.api.nvim_set_hl(0, "@variable", { italic = false })
      vim.api.nvim_set_hl(0, "@variable.parameter", { italic = false })
      vim.api.nvim_set_hl(0, "@variable.member", { italic = false })
      vim.api.nvim_set_hl(0, "@field", { italic = false })

      -- 🔑 Make EVERY highlight group non-italic
      for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
        if ok and hl.italic then
          hl.italic = false
          vim.api.nvim_set_hl(0, group, hl)
        end
      end

      require("notify").setup({
        background_colour = "#011627",
      })
    end,
  },
}

