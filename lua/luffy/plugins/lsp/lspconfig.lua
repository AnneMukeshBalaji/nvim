return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim", config = true },
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        opts.desc = "Go to definition"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Hover documentation"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Rename symbol"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Diagnostics (line)"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.HINT]  = "󰠠 ",
          [vim.diagnostic.severity.INFO]  = " ",
        },
      },
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    -- HTML LSP
    lspconfig.html.setup({
      capabilities = capabilities,
      filetypes = { "html", "ejs" },
    })

    -- Use ts_ls instead of deprecated tsserver
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    -- Emmet with EJS
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html", "css", "scss", "sass", "less",
        "javascriptreact", "typescriptreact", "svelte", "ejs",
      },
    })

    -- GraphQL
    lspconfig.graphql.setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- Svelte
    lspconfig.svelte.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    })
  end,
}

