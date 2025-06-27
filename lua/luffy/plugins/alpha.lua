return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header with Batman ASCII
    dashboard.section.header.val = {
      "           _                         _",
      "       _==/          i     i          \\==",
      "     /XX/            |\\___/|            \\XX\\",
      "   /XXXX\\            |XXXXX|            /XXXX\\",
      "  |XXXXXX\\_         _XXXXXXX_         _/XXXXXX|",
      " XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX",
      "|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|",
      "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|",
      " XXXXXX/^^^^\"\\XXXXXXXXXXXXXXXXXXXXX/^^^^^\\XXXXXX",
      "  |XXX|       \\XXX/^^\\XXXXX/^^\\XXX/       |XXX|",
      "    \\XX\\       \\X/    \\XXX/    \\X/       /XX/",
      "       \"\\       \"      \\X/      \"       /\"",
      "                  Zach Bolinger",
      "",
      "    \"Batman may die..But Bruce Wayne? Never\" – Batman",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Apply config
    alpha.setup(dashboard.opts)

    -- Disable folding
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

