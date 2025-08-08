
-- lua/luffy/plugins/lsp/mason.lua
return {
  -- 1. Setup mason.nvim first
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- optional: updates registry
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- 2. Then mason-lspconfig (depends on mason.nvim)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",     -- Lua
          -- "tsserver",   -- TypeScript/JavaScript
          "pyright",    -- Python
          -- "dartls",     -- Dart
        },
        automatic_installation = true,
      })
    end,
  },

  -- 3. Optional: mason-tool-installer (formatters, linters, etc.)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",    -- formatter
          "stylua",      -- Lua formatter
          "eslint_d",    -- JS/TS linter
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
}
