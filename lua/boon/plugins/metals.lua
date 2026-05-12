return {
	"scalameta/nvim-metals",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "j-hui/fidget.nvim" },
		-- { "saghen/blink.cmp" },
	},
	ft = { "scala", "sbt", "java" },
	opts = function()
		local metals_config = require("metals").bare_config()

		-- Must be set here, BEFORE initialize_or_attach — not inside on_attach
		metals_config.settings = {
			showImplicitArguments = true,
			excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
		}

		metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()

		metals_config.init_options.statusBarProvider = "off"

		-- on_attach fires after connection: use only for Metals-specific keymaps.
		-- Standard LSP keymaps (gd, gr, K, etc.) are handled by lsp.lua's LspAttach autocmd.
		metals_config.on_attach = function(client, bufnr)
			local map = function(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "Metals: " .. desc })
			end
			map("<leader>mc", require("telescope").extensions.metals.commands, "[M]etals [C]ommands")
			map("<leader>mh", require("metals").hover_worksheet, "[M]etals [H]over Worksheet")
		end

		return metals_config
	end,
	config = function(self, metals_config)
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end,
}
