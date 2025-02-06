-- Set the Leader key to Space
vim.g.mapleader = " "  -- This sets the Leader key to the spacebar

-- Map <Leader>n to toggle NvimTree
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Map <C-a> to select all text in the file (like Ctrl + A)
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- Keymap to switch between buffers
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bnext<CR>', { noremap = true, silent = true })  -- Move to next buffer
vim.api.nvim_set_keymap('n', '<Leader><S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })  -- Move to previous buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- here is the telescope nvim keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<C-fb>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<C-h>', builtin.help_tags, { desc = 'Telescope help tags' })
-- Keymap to open vertical split
vim.api.nvim_set_keymap('n', '<Leader>vs', ':vsp<CR>', { noremap = true, silent = true })
-- Keymap to close the current split
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
-- Set custom keybindings for LSP
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })


 -- Optionally, you can map fzf commands to keys
vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':GFiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':History<CR>', { noremap = true, silent = true })


-- Start live server with Ctrl + .
vim.api.nvim_set_keymap('n', '<C-.>', ':!live-server &<CR>', { noremap = true, silent = true, desc = 'Start live server' })

-- Stop live server with Ctrl + ,
vim.api.nvim_set_keymap('n', '<C-,>', ':!pkill live-server<CR>', { noremap = true, silent = true, desc = 'Stop live server' })

