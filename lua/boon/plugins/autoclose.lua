return {
    "m4xshen/autoclose.nvim",
    opts = {
        disabled_filetypes = {"text", "markdown"},
        keys = {
            ["$"] = {escape = true, close=true,pair ="$$", disabled_filetypes={}},
        }
    }
}
