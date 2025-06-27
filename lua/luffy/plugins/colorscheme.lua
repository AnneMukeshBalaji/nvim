return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- or "latte", "frappe", "macchiato"
      transparent_background = true,
      no_italic = true,
      styles = {
        comments = { "bold" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      highlight_overrides = {
        mocha = function(C)
          return {
            -- main editing area
            Normal = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
            EndOfBuffer = { bg = "NONE" },
            -- line numbers & gutter
            SignColumn = { bg = "NONE" },
            LineNr = { bg = "NONE" },
            CursorLineNr = { bg = "NONE" },
            -- borders and status
            WinSeparator = { bg = "NONE" },
            StatusLine = { bg = "NONE" },
            StatusLineNC = { bg = "NONE" },
            -- floating windows
            NormalFloat = { bg = "NONE" },
            -- comment style
            Comment = { fg = C.blue, bold = true, italic = false },
            -- wipe italics from other common groups
            Function = { italic = false },
            Identifier = { italic = false },
            Type = { italic = false },
            Statement = { italic = false },
            Keyword = { italic = false },
            Constant = { italic = false },
            String = { italic = false },
            Character = { italic = false },
            PreProc = { italic = false },
            Number = { italic = false },
            Boolean = { italic = false },
            Repeat = { italic = false },
            Conditional = { italic = false },
          }
        end,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

