return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local nf_colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    local nightfly_lualine_theme = {
      normal = {
        a = { bg = nf_colors.blue, fg = nf_colors.bg, gui = "bold" },
        b = { bg = nf_colors.bg, fg = nf_colors.fg },
        c = { bg = nf_colors.bg, fg = nf_colors.fg },
      },
      insert = {
        a = { bg = nf_colors.green, fg = nf_colors.bg, gui = "bold" },
        b = { bg = nf_colors.bg, fg = nf_colors.fg },
        c = { bg = nf_colors.bg, fg = nf_colors.fg },
      },
      visual = {
        a = { bg = nf_colors.violet, fg = nf_colors.bg, gui = "bold" },
        b = { bg = nf_colors.bg, fg = nf_colors.fg },
        c = { bg = nf_colors.bg, fg = nf_colors.fg },
      },
      command = {
        a = { bg = nf_colors.yellow, fg = nf_colors.bg, gui = "bold" },
        b = { bg = nf_colors.bg, fg = nf_colors.fg },
        c = { bg = nf_colors.bg, fg = nf_colors.fg },
      },
      replace = {
        a = { bg = nf_colors.red, fg = nf_colors.bg, gui = "bold" },
        b = { bg = nf_colors.bg, fg = nf_colors.fg },
        c = { bg = nf_colors.bg, fg = nf_colors.fg },
      },
      inactive = {
        a = { bg = nf_colors.inactive_bg, fg = nf_colors.semilightgray, gui = "bold" },
        b = { bg = nf_colors.inactive_bg, fg = nf_colors.semilightgray },
        c = { bg = nf_colors.inactive_bg, fg = nf_colors.semilightgray },
      },
    }

    -- Rose Color Scheme 
	local rp_colors= {
		_nc = "#16141f",
		base = "#191724",
		surface = "#1f1d2e",
		overlay = "#26233a",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ebbcba",
		pine = "#31748f",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		leaf = "#95b1ac",
		highlight_low = "#21202e",
		highlight_med = "#403d52",
		highlight_high = "#524f67",
		none = "NONE",
	}

    local rosepine_lualine_theme = {
      normal = {
        a = { bg = rp_colors.iris, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.base, fg = rp_colors.subtle},
        c = { bg = rp_colors.base, fg = rp_colors.subtle},
      },
      insert = {
        a = { bg = rp_colors.foam, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.base, fg = rp_colors.subtle},
        c = { bg = rp_colors.base, fg = rp_colors.subtle},
      },
      visual = {
        a = { bg = rp_colors.rose, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.base, fg = rp_colors.subtle},
        c = { bg = rp_colors.base, fg = rp_colors.subtle},
      },
      command = {
        a = { bg = rp_colors.love, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.base, fg = rp_colors.subtle},
        c = { bg = rp_colors.base, fg = rp_colors.subtle},
      },
      replace = {
        a = { bg = rp_colors.red, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.base, fg = rp_colors.subtle },
        c = { bg = rp_colors.base, fg = rp_colors.subtle },
      },
      inactive = {
        a = { bg = rp_colors.inactive_bg, fg = rp_colors.semilightgray, gui = "bold" },
        b = { bg = rp_colors.inactive_bg, fg = rp_colors.semilightgray },
        c = { bg = rp_colors.inactive_bg, fg = rp_colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = rosepine_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
