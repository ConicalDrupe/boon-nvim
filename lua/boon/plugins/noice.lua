return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          -- command_palette = true, -- position the cmdline and popupmenu together
          -- lsp_doc_border = false, -- add a border to hover docs and signature help
        },
    messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    enabled = false,
    },
    override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = false,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = false,
    },
    },
    dependencies = {
      -- NOTE: Requires cmp-cmdline in nvim-cmp
      "MunifTanjim/nui.nvim",
    }
  }
