return {
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for enhanced UI
      "mfussenegger/nvim-dap",  -- debugger support
    },
    config = function()
      require("flutter-tools").setup({
        flutter_path = "flutter", -- assuming flutter is in your PATH

        -- 🔧 Force the correct dart path here:
        lsp = {
          cmd = { "/home/Marshall/develop/flutter/bin/dart", "language-server", "--protocol=lsp" },

          color = {
            enabled = false, -- avoid error on documentColor request
            background = true,
            virtual_text = true,
            virtual_text_str = "■",
          },

          on_attach = function(_, bufnr)
            local keymap = vim.keymap.set
            local opts = { buffer = bufnr, silent = true }

            keymap("n", "<leader>fr", "<cmd>FlutterRun<CR>", opts)
            keymap("n", "<leader>fR", "<cmd>FlutterRestart<CR>", opts)
            keymap("n", "<leader>fq", "<cmd>FlutterQuit<CR>", opts)
            keymap("n", "<leader>fl", "<cmd>FlutterLogClear<CR>", opts)
            keymap("n", "<leader>fd", "<cmd>FlutterDevices<CR>", opts)
            keymap("n", "<leader>fe", "<cmd>FlutterEmulators<CR>", opts)
          end,
        },

        debugger = {
          enabled = true,
          run_via_dap = true,
        },

        ui = {
          border = "rounded",
          notification_style = "native",
        },

        widget_guides = {
          enabled = true,
        },

        closing_tags = {
          highlight = "Comment",
          prefix = "// ",
          enabled = true,
        },

        dev_log = {
          enabled = true,
          open_cmd = "tabedit",
        },
      })
    end,
  },
}
