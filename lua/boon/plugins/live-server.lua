return {
    "barrett-ruth/live-server.nvim",
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = function() 
      vim.keymap.set({'n','v'}, '<F11>', '<Cmd>LiveServerStart<cr>',{ noremap=false, silent=true})
    end
}
