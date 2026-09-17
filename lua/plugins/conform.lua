return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,
    default_format_opts = {
      timeout_ms = 200,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      dart = { "lsp" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      html = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
    },

  },
  init = function()
    -- Organize imports on save (like VS Code's source.organizeImports)
    -- Runs before format_on_save since init fires before config
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("OrganizeImports", { clear = true }),
      pattern = "*.ts,*.tsx,*.js,*.jsx,*.go,*.dart",
      callback = function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
          local kinds = client.server_capabilities.codeActionProvider
            and client.server_capabilities.codeActionProvider.codeActionKinds
          if kinds then
            for _, kind in ipairs(kinds) do
              if kind == "source.organizeImports" then
                vim.lsp.buf.code_action({
                  context = { only = { "source.organizeImports" } },
                  apply = true,
                })
                return
              end
            end
          end
        end
      end,
    })
  end,
}
