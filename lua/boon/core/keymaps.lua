-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
-- local ls = require "luasnip"

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

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

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tk", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tj", ":tabp<CR>") --  go to previous tab

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<S-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<S-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<S-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<S-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Quarto and slime Keymaps
-- cannot use <C-i>, which is equivalant to <Tab> (like <C-]> is equivalent to <Esc>)
vim.keymap.set({'n', 'i'}, '<leader>ic','<esc>i<cr>```{python}<cr>```<esc>0' ,{desc = '[i]nsert python [c]ode chunk'})
vim.keymap.set({'n', 'i'}, '<leader>iC','<esc>i<cr>```{r}<cr>```<esc>0' ,{desc = '[i]nsert R [c]ode chunk'})

-- Create a terminal and then Navigate to Previous Window
vim.keymap.set('n', '<leader>cr',':split term://ipython<cr> <bar> <C-w><C-p>' ,{desc = '[c]reate ipython [r]epl'})

-- local function send_cell()
--   if vim.b['quarto_is_r_mode'] == nil then
--     vim.fn['slime#send_cell']()
--     return
--   end
--   if vim.b['quarto_is_r_mode'] == true then
--     vim.g.slime_python_ipython = 0
--     local is_python = require('otter.tools.functions').is_otter_language_context 'python'
--     if is_python and not vim.b['reticulate_running'] then
--       vim.fn['slime#send']('reticulate::repl_python()' .. '\r')
--       vim.b['reticulate_running'] = true
--     end
--     if not is_python and vim.b['reticulate_running'] then
--       vim.fn['slime#send']('exit' .. '\r')
--       vim.b['reticulate_running'] = false
--     end
--     vim.fn['slime#send_cell']()
--   end
-- end
--
-- vim.keymap.set({'n','i'},'<m-cr>', send_cell)
-- --- Send code to terminal with vim-slime
-- --- If an R terminal has been opend, this is in r_mode
-- --- and will handle python code via reticulate when sent
-- --- from a python chunk.
-- local slime_send_region_cmd = ':<C-u>call slime#send_op(visualmode(), 1)<CR>'
-- slime_send_region_cmd = vim.api.nvim_replace_termcodes(slime_send_region_cmd, true, false, true)
-- local function send_region()
--   -- if filetyps is not quarto, just send_region
--   if vim.bo.filetype ~= 'quarto' or vim.b['quarto_is_r_mode'] == nil then
--     vim.cmd('normal' .. slime_send_region_cmd)
--     return
--   end
--   if vim.b['quarto_is_r_mode'] == true then
--     vim.g.slime_python_ipython = 0
--     local is_python = require('otter.tools.functions').is_otter_language_context 'python'
--     if is_python and not vim.b['reticulate_running'] then
--       vim.fn['slime#send']('reticulate::repl_python()' .. '\r')
--       vim.b['reticulate_running'] = true
--     end
--     if not is_python and vim.b['reticulate_running'] then
--       vim.fn['slime#send']('exit' .. '\r')
--       vim.b['reticulate_running'] = false
--     end
--     vim.cmd('normal' .. slime_send_region_cmd)
--   end
-- end
