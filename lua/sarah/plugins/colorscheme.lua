return {

    -- -- Which Color Scheme
    -- "sontungexpt/witch",
    -- priority = 1000,
    -- lazy = false,
    -- config = function(_, opts)
    --     require("witch").setup(opts)
    -- end,

    -- -- Visual Studio Code Scheme
    -- "askfiy/visual_studio_code",
    -- priority = 1000,
    -- config = function()
    --   vim.cmd([[colorscheme visual_studio_code]])
    -- end,

    -- Rose-Pine
    "rose-pine/neovim",
    priority = 1000,
    opts = {
        variant = "auto", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
            terminal = true,
            legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
            migrations = true, -- Handle deprecated options automatically
        },

        styles = {
            bold = true,
            italic = true,
            transparency = false,
        },
    },
    config = function()
        vim.cmd[[colorscheme rose-pine-main]]
    end,

    -- -- Doom Emacs Colorscheme
    -- "NTBBloodbath/doom-one.nvim",
    -- priority = 1000,
    -- dependencies = {
    --     "lukas-reineke/headlines.nvim",
    --     dependencies = "nvim-treesitter/nvim-treesitter",
    --     config = true
    -- },
    -- config = function()
    --     -- Add color to cursor
    --     vim.g.doom_one_cursor_coloring = false
    --     -- Set :terminal colors
    --     vim.g.doom_one_terminal_colors = true
    --     -- Enable italic comments
    --     vim.g.doom_one_italic_comments = false
    --     -- Enable TS support
    --     vim.g.doom_one_enable_treesitter = true
    --     -- Color whole diagnostic text or only underline
    --     vim.g.doom_one_diagnostics_text_color = false
    --     -- Enable transparent background
    --     vim.g.doom_one_transparent_background = false
    --     -- Pumblend transparency
    --     vim.g.doom_one_pumblend_enable = false
    --     vim.g.doom_one_pumblend_transparency = 20
    --     -- Plugins integration
    --     vim.g.doom_one_plugin_neorg = true
    --     vim.g.doom_one_plugin_barbar = false
    --     vim.g.doom_one_plugin_telescope = false
    --     vim.g.doom_one_plugin_neogit = true
    --     vim.g.doom_one_plugin_nvim_tree = true
    --     vim.g.doom_one_plugin_dashboard = true
    --     vim.g.doom_one_plugin_startify = true
    --     vim.g.doom_one_plugin_whichkey = true
    --     vim.g.doom_one_plugin_indent_blankline = true
    --     vim.g.doom_one_plugin_vim_illuminate = true
    --     vim.g.doom_one_plugin_lspsaga = false
    --     vim.cmd([[colorscheme doom-one]])
    -- end,

   }
