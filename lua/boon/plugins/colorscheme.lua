return {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- load this before all the other start plugins
    config = function()
      --load colorscheme here
      vim.cmd([[colorscheme nightfly]]) 
    end,
   }
