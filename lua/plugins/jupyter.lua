return {
  -- Molten: run code cells using Jupyter kernel, with inline output
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      -- Image output via kitty (since you use Kitty terminal)
      vim.g.molten_image_provider = "image.nvim"
      -- Output window settings
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    keys = {
      { "<localleader>mi", ":MoltenInit<CR>",                          desc = "Molten: Init kernel",        silent = true },
      { "<localleader>rr", ":MoltenReevaluateCell<CR>",                desc = "Molten: Re-evaluate cell",   silent = true },
      { "<localleader>os", ":noautocmd MoltenEnterOutput<CR>",         desc = "Molten: Open output window", silent = true },
      { "<localleader>oh", ":MoltenHideOutput<CR>",                    desc = "Molten: Hide output",        silent = true },
      { "<localleader>md", ":MoltenDelete<CR>",                        desc = "Molten: Delete cell",        silent = true },
      -- Visual mode Ctrl+Enter: run selection
      { "<C-CR>", ":<C-u>MoltenEvaluateVisual<CR>gv",                 desc = "Molten: Run selection",      silent = true, mode = "v" },
    },
  },

  -- image.nvim: renders images inline in Kitty terminal
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = { enabled = true },
        neorg = { enabled = false },
      },
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },

  -- jupytext.nvim: transparently converts .ipynb <-> % format on open/save
  {
    "GCBallesteros/jupytext.nvim",
    opts = {
      style = "hydrogen",
      output_extension = "auto",
      force_ft = "python",
    },
  },

  -- mini.ai: extend it with NotebookNavigator's cell text object
  -- This is what makes run_cell() able to detect # %% boundaries
  {
    "nvim-mini/mini.ai",
    opts = function(_, opts)
      opts.custom_textobjects = opts.custom_textobjects or {}
      opts.custom_textobjects.h = require("notebook-navigator").miniai_spec
    end,
  },

  -- NotebookNavigator: cell detection and execution using # %% markers
  {
    "GCBallesteros/NotebookNavigator.nvim",
    dependencies = {
      "nvim-mini/mini.ai",
      "benlubas/molten-nvim",
    },
    -- load immediately so cell detection is ready
    event = "VeryLazy",
    keys = {
      { "]h",      function() require("notebook-navigator").move_cell("d") end,  desc = "Next cell" },
      { "[h",      function() require("notebook-navigator").move_cell("u") end,  desc = "Prev cell" },
      -- Ctrl+Enter: run cell, stay on it (like Jupyter)
      { "<C-CR>",  function() require("notebook-navigator").run_cell() end,       desc = "Run cell" },
    },
    opts = {
      cell_markers = { python = "# %%" },
      repl_provider = "molten",
    },
  },
}
