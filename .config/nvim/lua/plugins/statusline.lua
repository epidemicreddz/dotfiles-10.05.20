return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()

		local function getWords()
    -- the third string here is the string for visual-block mode (^V)
    if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "" then
        return vim.fn.wordcount().visual_words .. ""
    else
        return vim.fn.wordcount().words .. ""
    end
end


		require('lualine').setup {
		  options = {
			icons_enabled = true,
			theme = 'auto',
			-- 			component_separators = { left = '', right = ''},
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			disabled_filetypes = {
			  statusline = {},
			  winbar = {},
			},
			ignore_focus = {'neo-tree'},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
			  statusline = 1000,
			  tabline = 1000,
			  winbar = 1000,
			}
		  },
		  sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			-- lualine_x = {'encoding', 'fileformat', 'filetype', 'progress'},
			lualine_x = {},
			lualine_y = {'filetype'},
			lualine_z = {getWords, 'location'}
		  },
		  inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {'location'},
			lualine_y = {},
			lualine_z = {}
		  },
		  tabline = {},
		  winbar = {},
		  inactive_winbar = {},
		  extensions = {}
		}
	end
}
