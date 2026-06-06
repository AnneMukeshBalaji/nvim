return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        bashls = {},
        html = {},
        cssls = {},
        ts_ls = {},
        eslint = {},
        jdtls = {},
        pyright = {},
        jsonls = {},
        yamlls = {},
        lemminx = {},
      },
    },
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc" },
    }),
    vim.lsp.config("bashls", {
      cmd = { "bash-language-server", "start" },
      filetypes = { "bash", "sh" },
      root_markers = { ".git" },
    }),
    vim.lsp.config("html", {
      cmd = { "vscode-html-language-server", "--stdio" },
      filetypes = { "html" },
      root_markers = { "package.json", ".git" },
    }),
    vim.lsp.config("cssls", {
      cmd = { "vscode-css-language-server", "--stdio" },
      filetypes = { "css", "scss", "less" },
      root_markers = { "package.json", ".git" },
    }),
    vim.lsp.config("ts_ls", {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    }),
    vim.lsp.config("eslint", {
      cmd = { "vscode-eslint-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "astro" },
      root_markers = {
        "package.json",
        "eslint.config.js",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc",
        ".git",
      },
    }),
    vim.lsp.config("jdtls", {
      cmd = { "jdtls" },
      filetypes = { "java" },
      root_markers = {
        "mvnw",
        "gradlew",
        "settings.gradle",
        "settings.gradle.kts",
        "build.xml",
        "pom.xml",
        "build.gradle",
        "build.gradle.kts",
        ".git",
      },
    }),
    vim.lsp.config("pyright", {
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      root_markers = {
        "pyrightconfig.json",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        ".git",
      },
    }),

    vim.lsp.config("jsonls", {
      cmd = { "vscode-json-language-server", "--stdio" },
      filetypes = { "json", "jsonc" },
      root_markers = { ".git" },
    }),

    vim.lsp.config("yamlls", {
      cmd = { "yaml-language-server", "--stdio" },
      filetypes = { "yaml" },
      root_markers = { ".git" },
    }),

    vim.lsp.config("lemminx", {
      cmd = { "lemminx" },
      filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
      root_markers = { ".git" },
    }),
    vim.lsp.enable({
      "lua_ls",
      "bashls",
      "html",
      "cssls",
      "ts_ls",
      "eslint",
      "jdtls",
      "pyright",
      "jsonls",
      "yamlls",
      "lemminx",
    }),
  },
}
