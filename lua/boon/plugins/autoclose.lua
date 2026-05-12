return {
	"m4xshen/autoclose.nvim",
	opts = {
		disabled_filetypes = { "text", "markdown" },
		keys = {
			["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = { "java", "scala" } },
			["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "markdown", "java", "scala" } },
			["`"] = { escape = true, close = false, pair = "```" },
			["*"] = { escape = true, close = false, pair = "**", enabled_filetypes = { "markdown" } },
		},
	},
}
