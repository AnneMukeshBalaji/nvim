return {
  -- nvim-treesitter playground plugin
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",  -- Lazy load the plugin on command
  },

  -- nvim-treesitter plugin with configuration
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",          -- C language
        "java",       -- Java
        "python",     -- Python
        "html",       -- HTML
        "css",        -- CSS
        "javascript", -- JavaScript (covers Node.js and Express.js)
        "typescript", -- TypeScript (for React)
        "json",       -- JSON (for MongoDB)
      },

      -- Uncomment to enable 'matchup' if needed
      -- matchup = {
      --   enable = true,
      -- },

      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },

      playground = {
        enable = true,
        disable = {},
        updatetime = 25,  -- Debounced time for highlighting nodes
        persist_queries = true,  -- Keep queries across sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Add mdx filetype for Treesitter
      vim.filetype.add({
        extension = {
          mdx = "mdx",  -- Add .mdx filetype to markdown
        },
      })
      vim.treesitter.language.register("markdown", "mdx")  -- Register mdx as markdown
    end,
  },
}

