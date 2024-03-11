-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local ls = require "luasnip"

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

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- NvimToggleTree keymap
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope, ff finds files, fs finds text in file, fc finds txt on current string
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- tmux-nvim navigator remap
keymap.set("n","<S-h>", ":<C-U>TmuxNavigateLeft<cr>")
keymap.set("n", "<S-j>", ":<C-U>TmuxNavigateDown<cr>")
keymap.set("n", "<S-k>", ":<C-U>TmuxNavigateUp<cr>")
keymap.set("n", "<S-l>", ":<C-U>TmuxNavigateRight<cr>")
--keymaps.set("n", "{Previous-Mapping}" ":<C-U>TmuxNavigatePrevious<cr>")

-- nvim-jupyter kit remap
keymap.set("n","<S-CR>",":call jukit#send#line()<cr>")

-- luasnip keymaps

-- for expanding or jumping snippet,in insert or select mode
keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- for jumping backwards
keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is for selecting list of options
keymap.set("i", "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- shortcut to source my luasnips file again, reloads snippets
keymap.set("n", "<leader><C-s>", "<cmd>source ~/.config/nvim/lua/boon/plugins/snippets.lua<CR>")

