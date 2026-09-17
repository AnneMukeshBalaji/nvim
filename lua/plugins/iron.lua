-- iron.nvim — Interactive REPLs Over Neovim
-- Based on: https://youtu.be/eIp31pLQ4sI
--
-- This replicates the exact workflow from the video:
--   • Vertical REPL pane on the right (IPython for Python)
--   • # %% cell markers (Hydrogen/VSCode style)
--   • Two keybinding families:
--       <leader>is* — send (accumulates history in REPL)
--       <leader>ic* — clear THEN send (shows only current output)
--   • Run block + jump to next cell (<leader>ij)
--   • Restart, interrupt, quit shortcuts

return {
  {
    "Vigemus/iron.nvim",
    event = "VeryLazy",
    config = function()
      local iron = require("iron.core")

      iron.setup({
        -- ─── Config ──────────────────────────────────────────────────────
        config = {
          -- Scratch REPL buffers are wiped when the window is closed
          scratch_repl = true,

          -- ─── REPL commands per filetype ──────────────────────────────
          -- The video uses IPython for Python, fish for shell, lua for Lua.
          repl_definition = {
            python = {
              -- IPython: colorful, %magic commands, better repr
              command = { "ipython", "--no-autoindent" },
              format  = require("iron.fts.common").bracketed_paste_python,
            },
            sh = {
              command = { "fish" },
            },
            fish = {
              command = { "fish" },
            },
            lua = {
              command = { "lua" },
            },
          },

          -- ─── Window layout ───────────────────────────────────────────
          -- Open REPL in a vertical split on the right (40 % width),
          -- exactly as shown in the video.
          repl_open_cmd = require("iron.view").split.vertical.botright("40%"),
        },

        -- ─── Built-in keymaps ─────────────────────────────────────────
        -- Prefix: <leader>is  ("i" = interactive, "s" = send)
        -- These ACCUMULATE output in the REPL history.
        keymaps = {
          send_motion       = "<leader>iss",  -- send motion  e.g. <leader>issip → send paragraph
          visual_send       = "<leader>iss",  -- send visual selection
          send_file         = "<leader>isf",  -- send whole file
          send_line         = "<leader>isl",  -- send current line
          send_paragraph    = "<leader>isp",  -- send paragraph (blank-line delimited)
          send_until_cursor = "<leader>isu",  -- send from top to cursor
          send_mark         = "<leader>ism",
          mark_motion       = "<leader>imm",
          mark_visual       = "<leader>imm",
          remove_mark       = "<leader>imd",
          cr                = "<leader>i<cr>",
          interrupt         = "<leader>isi",  -- Ctrl-C (interrupt long run)
          exit              = "<leader>isq",  -- quit REPL window
          clear             = "<leader>icl",  -- clear REPL screen only
        },

        -- Highlight sent region briefly
        highlight = { italic = true },

        -- Don't send blank lines
        ignore_blank_lines = true,
      })

      -- ─── Clear-then-send helpers ─────────────────────────────────────
      -- Second keybinding family: <leader>ic*
      -- These CLEAR the REPL first so only the current selection's output
      -- is visible — the "clean slate" workflow from the video.
      local function clear_and(send_fn)
        return function()
          iron.send(nil, string.char(12)) -- Ctrl-L = clear screen
          send_fn()
        end
      end

      local map  = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Clear + send line
      map("n", "<leader>icl", clear_and(function() iron.send_line() end),
        vim.tbl_extend("force", opts, { desc = "Iron: Clear + send line" }))

      -- Clear + send paragraph
      map("n", "<leader>icp", clear_and(function() iron.send_paragraph() end),
        vim.tbl_extend("force", opts, { desc = "Iron: Clear + send paragraph" }))

      -- Clear + send visual selection
      map("v", "<leader>ics", clear_and(function() iron.visual_send() end),
        vim.tbl_extend("force", opts, { desc = "Iron: Clear + send selection" }))

      -- Clear + send whole file
      map("n", "<leader>icf", clear_and(function() iron.send_file() end),
        vim.tbl_extend("force", opts, { desc = "Iron: Clear + send file" }))

      -- ─── REPL window management ───────────────────────────────────────
      -- <leader>it  toggle open/close
      -- <leader>if  focus REPL
      -- <leader>ir  restart REPL
      map("n", "<leader>it", "<cmd>IronRepl<cr>",
        vim.tbl_extend("force", opts, { desc = "Iron: Toggle REPL" }))
      map("n", "<leader>if", "<cmd>IronFocus<cr>",
        vim.tbl_extend("force", opts, { desc = "Iron: Focus REPL" }))
      map("n", "<leader>ir", "<cmd>IronRestart<cr>",
        vim.tbl_extend("force", opts, { desc = "Iron: Restart REPL" }))

      -- ─── Cell / block navigation ──────────────────────────────────────
      -- The video author uses  # %%  markers (same as VSCode / Hydrogen).
      -- <leader>ij  = send current # %% block then jump to the next block
      -- This replicates "run cell and advance" from Jupyter.
      local function find_next_cell()
        -- search forward for next # %% marker
        local found = vim.fn.search("^# %%", "W")
        if found ~= 0 then
          vim.cmd("normal! j") -- land inside cell body, not on the marker
        end
      end

      local function send_cell_and_advance()
        -- Send from current # %% to the next one (or EOF)
        local start_ln = vim.fn.search("^# %%", "bcnW") -- find start of current cell
        local end_ln   = vim.fn.search("^# %%", "nW")   -- find start of next cell

        local lines
        if end_ln == 0 then
          -- last cell: send to end of file
          lines = vim.api.nvim_buf_get_lines(0, start_ln, -1, false)
        else
          lines = vim.api.nvim_buf_get_lines(0, start_ln, end_ln - 1, false)
        end

        -- Strip pure-comment lines (author's customization in the video)
        lines = vim.tbl_filter(function(l)
          return not l:match("^%s*#[^%%]") -- keep # %% markers, drop plain # comments
        end, lines)

        iron.send(nil, lines)
        find_next_cell()
      end

      map("n", "<leader>ij", send_cell_and_advance,
        vim.tbl_extend("force", opts, { desc = "Iron: Send cell + next" }))

      -- Navigate between # %% markers without running
      map("n", "]c", function() find_next_cell() end,
        vim.tbl_extend("force", opts, { desc = "Iron: Next cell" }))
      map("n", "[c", function()
        -- jump to previous # %% marker
        local found = vim.fn.search("^# %%", "bW")
        if found ~= 0 then vim.cmd("normal! j") end
      end, vim.tbl_extend("force", opts, { desc = "Iron: Prev cell" }))

    end,
  },
}
