if vim.g.snippets ~= "luasnip" then
  return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  -- this tells LuaSnip to remember to keep around the last snippet.
  -- you can jump back into it even if you move outside of the selection.
  history = true,

  -- Dynamic snippets, to update as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!!
  -- ext_opts = nil,
  ext_opts = {
  [types.choiceNode] = {
    active = {
      virt_text = { { "󰁍", "Error" } },
    },
  },
},
}
