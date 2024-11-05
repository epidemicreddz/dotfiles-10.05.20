return {
	'nvim-neo-tree/neo-tree.nvim',
		dependencies = { 'nvim-lua/plenary.nvim',
				 'nvim-tree/nvim-web-devicons',
				 'MunifTanjim/nui.nvim' },
	config = function()
		vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', {})
		vim.keymap.set('n', '<leader>b', ':Neotree buffers /<CR>', {})
		local config = require("neo-tree")
		config.setup({
		window = {
			width = 5,
			auto_expand_width = true,
			position = "left"
		}})
	end
}

