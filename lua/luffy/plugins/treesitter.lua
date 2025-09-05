
return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
          "json", "javascript", "typescript", "tsx",
          "yaml", "html", "css", "prisma",
          "markdown", "markdown_inline", "svelte", "graphql",
          "bash", "lua", "vim", "vimdoc", "query",
          "dockerfile", "gitignore",
          "c", "cpp", "go", "java", "python", "sql",
          "dart",
        },
        auto_install = true,
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        no_italic = true,
        styles = {
          comments = { "bold" },
        },
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
