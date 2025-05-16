return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  -- Only loads when markdown is opened
  lazy = true,
  ft = "markdown",
  cmd = {'ObsidianNew','ObsidianQuickSwitch','ObsidianSearch'},
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

 -- Key Mappings for obsidian
 keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
      { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
      { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
      { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n" },
      { "<leader>ov", "<cmd>ObsidianWorkspace<cr>", desc = "Open [o]bsidian [v]ault", mode = "n" },
      { "<leader>oO", "<cmd>ObsidianOpen<cr>", desc = "Open [o]bsidian [v]ault", mode = "n" },
    },

  opts = {
  workspaces = {
    {
      name = "Notes2024",
      path = "/home/boon/Vaults/Notes2024",
    },
    {
      name = "Medium",
      path = "/home/boon/Vaults/Medium",
    },
    {
      name = "localVault",
      path = "/home/boon/Vaults/localVault",
      -- `strict=true` here tells obsidian to use the `path` as the workspace/vault root,
      -- even though the actual Obsidian vault root may be `~/vaults/personal/`.
      strict = true,
      overrides = {
        -- ...
        },
    },
  },


  -- The below adds autocompletion via nvim-cmp
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },

  new_notes_location = "current_dir",
  wiki_link_func = function(opts)
    if opts.id == nil then
      return string.format("[[%s]]", opts.label)
    elseif opts.label ~= opts.id then
      return string.format("[[%s|%s]]", opts.id, opts.label)
    else
      return string.format("[[%s]]", opts.id)
    end
  end,

  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,


  -- -@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    -- vim.fn.jobstart({"open", url})  -- Mac OS
    vim.fn.jobstart({"xdg-open", url})  -- linux
  end,

  templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
      tags = "",
  },
  },
  config = function (_, opts)
    vim.opt.conceallevel = 1
    require('obsidian').setup(opts)
    -- vim.keymap.set('n','<leader>on', '<cmd>ObsidianNew<cr>')
      -- { "<leader>on", "<cmd>ObsidianNew<cr>"}
  end
}
