return {
    'quarto-dev/quarto-nvim',
  dependencies = {
    {'jmbuhr/otter.nvim',
      opts={},
      tag='v1.15.1'},
    {'hrsh7th/nvim-cmp'},
    {'neovim/nvim-lspconfig'},
    {'nvim-treesitter/nvim-treesitter'},
    },
  opts={
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = "curly",
      languages = { "r", "python", "julia", "bash", "html" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = false,
      default_method = 'slime', -- 'molten' or 'slime'
      ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
                       -- Takes precedence over `default_method`
      never_run = { "yaml" }, -- filetypes which are never sent to a code runner
    },
    keymap = {
      -- set whole section or individual keys to `false` to disable
      hover = "K",
      definition = "gd",
      type_definition = "gD",
      rename = "<leader>lR",
      format = "<leader>lf",
      references = "gr",
      document_symbols = "gS",
    }
  },
}
