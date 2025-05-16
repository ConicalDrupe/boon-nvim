return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"
      local dap_python require "dap-python"

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({
        commented=true
      })

     dap_python.setup("python3")

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = '[d]ap [c]ontinue'})
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = '[d]ap step [i]nto'})
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = '[d]ap step [o]ver'})
      vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = '[d]ap step [O]ut'})
      -- vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<leader>dr", dap.restart, { desc = '[d]ap [r]estart'})
      vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = '[d]ap quit' })

      vim.keymap.set("n", "<leader>du", ui.toggle, { desc = '[d]ap [u]i toggle' })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
