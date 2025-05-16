return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    opts = {
      db_competion = function()
        require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
      end,
    },
    config = function(_, opts)
      -- location to save connections, and queries?
      -- vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"
      vim.g.db_ui_save_location  = '~/sql'
      -- Disables execute on save
      vim.g.db_ui_execute_on_save =  '0'
      vim.g.db_ui_use_nerd_fonts =  '1'
      vim.g.db_ui_show_database_icon =  '1'

      -- Table Helpers
      vim.g.db_ui_table_helpers = {

              sqlite = {
                  top= "SELECT * FROM {optional_schema}{table} LIMIT 100"
              },

              sqlserver={
                  top= "SELECT TOP 100 * FROM {optional_schema}{table}"
              },

          },


      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
        },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      })
      -- sets ExecuteQuery to F5
      vim.keymap.set({'n','v'}, '<F5>', '<Plug>(DBUI_ExecuteQuery)',{ noremap=false, silent=true})
      -- Default of Save Query is <leader>W
      vim.keymap.set({'n','v'}, '<leader>W', '<Plug>(DBUI_SaveQuery)',{ noremap=false, silent=true})

      -- For Table Filling
      -- See dadbod-ui docs. See db_ui#query and b:db_ui_table_name b:db_ui_schema_name buffers
      -- vim.keymap.set('n', '<leader>eeee', function()
      --   vim.cmd[[ db_ui#query ]]
      -- end,

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
          "mysql",
          "plsql",
        },
        callback = function()
          vim.schedule(opts.db_completion)
        end,
      })

    -- -- Table Helpers
    -- vim.g.db_ui_table_helpers = {
    --             "sqlite": {
    --                 "top": "SELECT * FROM {optional_schema}{table} LIMIT 100"
    --             },
    --             "sqlserver":{
    --                 "top": "SELECT TOP 100 * FROM {optional_schema}{table}"
    --             },
    --         },

    end,
    keys = {
      { "<leader>Dt", "<cmd>DBUIToggle<cr>", desc = "Toggle UI" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },
      { "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
      { "<leader>Dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
  },
}
