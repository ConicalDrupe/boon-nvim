return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()

     -- For Hiding API Keys on streaming
      require("nvim-dap-virtual-text").setup {
        -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
            return "*****"
          end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
      }
    -- endOfhiding API keys


      local c_ls_debugger = "gdb"--vim.fn.exepath "/mnt/c/Users/C/.vscode/extensions/ms-vscode.cpptools-1.24.5-win32-x64/debugAdapters/bin/OpenDebugAD7.exe"
      if c_ls_debugger ~= "" then
        dap.adapters.gdb = {
          type = "executable",
          command = c_ls_debugger,
          options = {
                       detached = false
                    }
        }

        dap.configurations.c= {
          {
            type = "gdb",
            name = "Launch",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ',vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
            -- exitAfterTaskReturns = false,
            -- debugAutoInterpretAllModules = false,
          },
         {
            name = 'Select and attach to process',
            type = 'gdb',
            request = 'attach',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            pid = function()
                local name = vim.fn.input('Executable name (filter): ')
                return require("dap.utils").pick_process({ filter = name })
            end,
            cwd = '${workspaceFolder}',
          },
        }
      end

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      -- vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F13>", dap.restart)

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
