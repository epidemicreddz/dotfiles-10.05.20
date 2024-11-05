-- treesitter >> i  dont actually know lmao
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup{
		window = {
			ensure_installed = { "lua", "c" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true }
		},

		mappings = {
			["<tab>"] = "open"
		},

		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
	}
	end
}

