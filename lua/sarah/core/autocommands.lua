-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'remove line numbers in terminal',
  group = vim.api.nvim_create_augroup('quarto-term', { clear = true }),
  callback = function()
    vim.wo.number = false
  end,
})

-- Disable Treesitter for latex files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex" , 
    command = "TSBufDisable highlight"
})
