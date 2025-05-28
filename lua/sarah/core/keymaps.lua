-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
-- local ls = require "luasnip"

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "kl", "<ESC>")

-- clear search highlights: by pressing Space + h
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- page up and page down /w centering
-- keymap.set("n", "<C-d>", "<C-d>zz")
-- keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<S-d>", "<C-d>zz")
keymap.set("n", "<S-u>", "<C-u>zz")

-- increment/decrement numbers: Space + +, Space + -
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>sr", "<C-w>b 10<C-w>_ <C-w><C-k>", {desc = '[s]plit [r]esize - small bottom'}) -- make bottom window 10 lines (for ipython terminal)
keymap.set("n", "<leader>sR", "<C-w>b <C-w>_ <C-w><C-k>", {desc = '[s]plit [R]esize - large bottom'}) -- make bottom window 10 lines (for ipython terminal)

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tk", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tj", ":tabp<CR>") --  go to previous tab

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<S-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<S-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<S-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<S-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Telescope for viewing buffers
vim.keymap.set('n', '<leader><S-h>', '<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>', {desc = '[H]elp Buffers'})

-- Create terminal window
-- vim.keymap.set('n', '<leader>ct',':split terminal<cr> <C-w><C-p>' ,{desc = '[c]reate ipython [r]epl'})
vim.keymap.set('n', '<leader>ct',':split term://bash<cr>' ,{desc = '[c]reate [t]erminal'})

-- Exit out of terminal mode
vim.keymap.set('t', '<C-t>', "<C-\\><C-n> <C-w><C-p>",{silent = true, desc = 'Exit Terminal mode'})
