local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


-- Show number of buffers in winbar
-- Function to get the full path and replace the home directory with ~
  -- local function get_winbar_path()
  --   local full_path = vim.fn.expand("%:p:h")
  --   return full_path:gsub(vim.fn.expand("$HOME"), "~")
  -- end
  -- -- Function to get the number of open buffers using the :ls command
  -- local function get_buffer_count()
  --   local buffers = vim.fn.execute("ls")
  --   local count = 0
  --   -- Match only lines that represent buffers, typically starting with a number followed by a space
  --   for line in string.gmatch(buffers, "[^\r\n]+") do
  --     if string.match(line, "^%s*%d+") then
  --       count = count + 1
  --     end
  --   end
  --   return count
  -- end
  -- -- Function to update the winbar
  -- local function update_winbar()
  --   local home_replaced = get_winbar_path()
  --   local buffer_count = get_buffer_count()
  --   vim.opt.winbar = "%#WinBar1#%m "
  --     .. "%#WinBar2#("
  --     .. buffer_count
  --     .. ") "
  --     -- this shows the filename on the left
  --     .. "%#WinBar3#"
  --     .. vim.fn.expand("%:t")
  --     -- This shows the file path on the right
  --     .. "%*%=%#WinBar1#"
  --     .. home_replaced
  --   -- I don't need the hostname as I have it in lualine
  --   -- .. vim.fn.systemlist("hostname")[1]
  -- end
  -- -- Autocmd to update the winbar on BufEnter and WinEnter events
  -- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  --   callback = update_winbar,
  -- })
