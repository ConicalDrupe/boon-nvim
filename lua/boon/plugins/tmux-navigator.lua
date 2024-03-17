return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  config = function()
  local keymap = vim.keymap 
  keymap.set("n","<S-h>", ":<C-U>TmuxNavigateLeft<cr>")
  keymap.set("n", "<S-j>", ":<C-U>TmuxNavigateDown<cr>")
  keymap.set("n", "<S-k>", ":<C-U>TmuxNavigateUp<cr>")
  keymap.set("n", "<S-l>", ":<C-U>TmuxNavigateRight<cr>")
  end,
}
