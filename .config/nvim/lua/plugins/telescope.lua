return {
	-- telescope >> fuzzy finder + grep
	{
		"nvim-telescope/telescope.nvim", dependencies = {'nvim-lua/plenary.nvim'},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>p', builtin.find_files, {})
			vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
		end},

	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup({
				extensions = {
   					["ui-select"] = {
 	     				require("telescope.themes").get_dropdown {
						}
					}
		  		}
			})
			require("telescope").load_extension("ui-select")
		end
	},

	-- zoxide >> my beloved
	{
		'nanotee/zoxide.vim',

		dependencies = {'nvim-telescope/telescope.nvim'},
		config = function ()
			vim.g.zoxide_use_select = true
		end
	},
}
