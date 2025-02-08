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
keymap.set("n", "<leader>sr", "<C-w>b 10<C-w>_ <C-w><C-k>", {desc = '[S]plit [R]esize'}) -- make bottom window 10 lines (for ipython terminal)

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

-- Quarto and slime Keymaps
-- cannot use <C-i>, which is equivalant to <Tab> (like <C-]> is equivalent to <Esc>)
vim.keymap.set({'n', 'i'}, '<leader>ic','<esc>i<cr>```{python}<cr>```<esc>0' ,{desc = '[i]nsert python [c]ode chunk'})
vim.keymap.set({'n', 'i'}, '<leader>iC','<esc>i<cr>```{r}<cr>```<esc>0' ,{desc = '[i]nsert R [c]ode chunk'})

-- Create a terminal and then Navigate to Previous Window
vim.keymap.set('n', '<leader>cr',':split term://ipython3<cr> <bar> <C-w><C-p>' ,{desc = '[c]reate ipython [r]epl'})
vim.keymap.set('n', '<leader>cR',':split term://R --no-save<cr> <bar> <C-w><C-p>' ,{desc = '[c]reate ipython [r]epl'})

-- Open my Obsian in current buffer
-- vim.keymap.set('n', '<C-n>', '<cmd>edit ~/Vaults/Notes_2024/<cr>')
vim.keymap.set('n', '<C-n>',function ()
    vim.cmd([[vsplit]])
    vim.cmd([[edit ~/Vaults/Notes2024/]])
end)

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
--
vim.g['quarto_is_r_mode'] = nil
vim.g['reticulate_running'] = false

local function send_cell()
    if vim.b['quarto_is_r_mode'] == nil then
        vim.fn['slime#send_cell']()
        return
    end
    if vim.b['quarto_is_r_mode'] == true then
        vim.g.slime_python_ipython = 0
        local is_python = require('otter.tools.functions').is_otter_language_context 'python'
        if is_python and not vim.b['reticulate_running'] then
            vim.fn['slime#send']('reticulate::repl_python()' .. '\r')
            vim.b['reticulate_running'] = true
        end
        if not is_python and vim.b['reticulate_running'] then
            vim.fn['slime#send']('exit' .. '\r')
            vim.b['reticulate_running'] = false
        end
        vim.fn['slime#send_cell']()
    end
end

--- Send code to terminal with vim-slime
--- If an R terminal has been opend, this is in r_mode
--- and will handle python code via reticulate when sent
--- from a python chunk.
local slime_send_region_cmd = ':<C-u>call slime#send_op(visualmode(), 1)<CR>'
slime_send_region_cmd = vim.api.nvim_replace_termcodes(slime_send_region_cmd, true, false, true)
local function send_region()
    -- if filetyps is not quarto, just send_region
    if vim.bo.filetype ~= 'quarto' or vim.b['quarto_is_r_mode'] == nil then
        vim.cmd('normal' .. slime_send_region_cmd)
        return
    end
    if vim.b['quarto_is_r_mode'] == true then
        vim.g.slime_python_ipython = 0
        local is_python = require('otter.tools.functions').is_otter_language_context 'python'
        if is_python and not vim.b['reticulate_running'] then
            vim.fn['slime#send']('reticulate::repl_python()' .. '\r')
            vim.b['reticulate_running'] = true
        end
        if not is_python and vim.b['reticulate_running'] then
            vim.fn['slime#send']('exit' .. '\r')
            vim.b['reticulate_running'] = false
        end
        vim.cmd('normal' .. slime_send_region_cmd)
    end
end

vim.keymap.set({'n','i'},'<leader><C-p>',send_cell, { desc = 'send code cell to terminal' })

-- RIP PAP and VRIP (My helpful utilities :] )

-- RIP
-- "r creates a register for the following command, <C-R>r pastes this named register r
-- <C-R>0 pastes the default yank register
vim.keymap.set({'n'}, 'rip', '"ryiw vip :sno/<C-R>r//g<left><left>', { desc = '[R]eplace word [I]nside [P]aragraph '})

-- VRIP
-- (Removes iw in yiw, which is [y]ank [i]nside [w]hitespace)
-- Also uses :sno which turns of regex
vim.keymap.set({'v'}, 'rip', '"ry vip :sno/<C-R>r//g<left><left>', { desc = 'Visual [R]eplace word [I]nside [P]aragraph '})

-- PAP 
-- Same principle as RIP and VRIP, except auto completes repalce by pasting in current yank buffer ( <C-R>0 )
-- vim.keymap.set({'n'}, 'pip', '"ryiw vip :sno/<C-R>r/<C-R>0/g<cr>', { desc = '[P]aste [I]nside [P]aragraph '})
-- vim.keymap.set({'v'}, 'pip', '"ry vip :sno/<C-R>r/<C-R>0/g<cr>', { desc = 'Visual [R]eplace [I]nside [P]aragraph '})
