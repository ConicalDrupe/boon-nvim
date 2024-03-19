return {
  'jpalardy/vim-slime',
  init = function()
    vim.g.slime_target = 'neovim'
    vim.g.slime_python_ipython = 1
  end,
  config = function()
    vim.keymap.set({'n','i'},'<m-cr>', function ()
      vim.cmd([[ call slime#send_cell() ]])
    end, { desc = 'send code cell to terminal' })
      end,
}
