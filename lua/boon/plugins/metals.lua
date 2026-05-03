return {
	"scalameta/nvim-metals",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "j-hui/fidget.nvim" },
		-- { "saghen/blink-cmp" },
	},
	ft = { "scala", "sbt", "java" },
	opts = function()
		local metals_config = require("metals").bare_config()
		metals_config.on_attach = function(client, bufnr)
			-- your on_attach function
			metals_config.settings = {
				showImplicitArguments = true,
				excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
			}

			metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()
			metals_config.init_options.statusBarProvider = "off"
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
