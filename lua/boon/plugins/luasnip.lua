return {
        'L3MON4D3/LuaSnip',
        version='2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windowsluasnip
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),

        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets

          -- Add snippet path below

          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {
          history = true,
          updateevents = "TextChanged,TextChangedI",
          enable_autosnippets = true,
        },
        config = function(_,opts)
          require('luasnip').setup(opts)
          require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})
          local ls = require('luasnip')

          -- Jump forward in snippet
          vim.keymap.set({ 'i', 's'}, '<C-k>', function ()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            end
          end, {silent = true})

          vim.keymap.set({ 'i', 's'}, '<C-j>', function ()
            if ls.jumpable(-1) then
              ls.jump(-1)
            end
          end, {silent = true})

          vim.keymap.set({ 'i', 's'}, '<C-l>', function ()
            if ls.choice_active() then
              ls.choice_active(1)
            end
          end, {silent = true})

          vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/' .. vim.env.NVIM_APPNAME ..'/lua/boon/snippets/snippets.lua<CR>', {desc='[s]nippets reload'})
      end,

      }

