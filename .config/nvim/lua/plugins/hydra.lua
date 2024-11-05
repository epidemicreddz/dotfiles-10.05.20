return {

	{'nvimtools/hydra.nvim',
	config = function ()
		local Hydra = require('hydra')
		Hydra({
		   name = 'sidescroll',
		   mode = 'n',
		   body = 'z',
		   heads = {
			  { 'h', 'zh' },
			  { 'l', 'zl', { desc = '←/→' } },
			  { 'H', 'zH' },
			  { 'L', 'zL', { desc = 'half screen ←/→' } },
		   },
		   config = {

		   }
		})

		local hint = [[
        -= options =-
 ^
 󰍜 %{ve} _v_irtual edit
 󰉶 %{list} _i_nvisible characters  
 󰓆 %{spell} _s_pell
  %{lb} _l_ine break
 󰖶 %{wrap} _w_rap
 󰆾 %{cul} _c_ursor line
 󰉻 %{nu} _n_umber
 󰷐 %{rnu} _r_elative number
 󰠘 %{aw} _a_utosave
 󰉖 %{acd} _d_ynamic directory
 󰛑 %{di} _q_uiet syntax
 ^
 ^^^^_<tab>_ config // _<esc>_ exit
			]]

			Hydra({
			   name = 'options',
			   hint = hint,
			   config = {
				  color = 'red',
				  invoke_on_body = true,
				  hint = {
					border = 'rounded',	
					position = 'middle'
				  }
			   },
			   mode = {'n','x'},
			   body = '<leader>o',
			   heads = {
				  { 'q', function()
					   local configure = vim.diagnostic.config()
					   local signs = configure.signs
					   if signs == true then
						   vim.diagnostic.config({ signs = false })
						   vim.diagnostic.config({ virtual_text = false })
						   vim.diagnostic.config({ underline = false })
					   else
						  vim.diagnostic.config({ signs = true })
						  vim.diagnostic.config({ virtual_text = true })
						  vim.diagnostic.config({ underline = true })
					   end
   					end, { desc = 'autowrite' } },
				  { 'a', function()
					 if vim.o.autowrite == true then
						vim.o.autowrite = false
					 else
						vim.o.autowrite = true
					 end
				  end, { desc = 'autowrite' } },
				  { 'd', function()
					 if vim.o.autochdir == true then
						vim.o.acd = false
					 else
						vim.o.acd = true
					 end
				  end, { desc = 'autochdir' } },
				  { 'n', function()
					 if vim.o.number == true then
						vim.o.number = false
					 else
						vim.o.number = true
					 end
				  end, { desc = 'number' } },
				  { 'r', function()
					 if vim.o.relativenumber == true then
						vim.o.relativenumber = false
					 else
						vim.o.number = true
						vim.o.relativenumber = true
					 end
				  end, { desc = 'relativenumber' } },
				  { 'v', function()
					 if vim.o.virtualedit == 'all' then
						vim.o.virtualedit = 'block'
					 else
						vim.o.virtualedit = 'all'
					 end
				  end, { desc = 'virtualedit' } },
				  { 'i', function()
					 if vim.o.list == true then
						vim.o.list = false
					 else
						vim.o.list = true
					 end
				  end, { desc = 'show invisible' } },
				  { 's', function()
					 if vim.o.spell == true then
						vim.o.spell = false
					 else
						vim.o.spell = true
					 end
				  end, { exit = true, desc = 'spell' } },
  				  { 'l', function()
					 if vim.o.linebreak == true then
						vim.o.linebreak = false
					 else
						vim.o.linebreak = true
						vim.o.wrap = true
						-- Dealing with word wrap:
						-- If cursor is inside very long line in the file than wraps
						-- around several rows on the screen, then 'j' key moves you to
						-- the next line in the file, but not to the next row on the
						-- screen under your previous position as in other editors. These
						-- bindings fixes this.
						vim.keymap.set('n', 'k', function() return vim.v.count > 0 and 'k' or 'gk' end,
												 { expr = true, desc = 'k or gk' })
						vim.keymap.set('n', 'j', function() return vim.v.count > 0 and 'j' or 'gj' end,
												 { expr = true, desc = 'j or gj' })

					 end
				  end, { exit = true, desc = 'spell' } },
				  { 'w', function()
					 if vim.o.wrap ~= true then
						vim.o.wrap = true
						-- Dealing with word wrap:
						-- If cursor is inside very long line in the file than wraps
						-- around several rows on the screen, then 'j' key moves you to
						-- the next line in the file, but not to the next row on the
						-- screen under your previous position as in other editors. These
						-- bindings fixes this.
						vim.keymap.set('n', 'k', function() return vim.v.count > 0 and 'k' or 'gk' end,
												 { expr = true, desc = 'k or gk' })
						vim.keymap.set('n', 'j', function() return vim.v.count > 0 and 'j' or 'gj' end,
												 { expr = true, desc = 'j or gj' })
					 else
						vim.o.wrap = false
						vim.keymap.del('n', 'k')
						vim.keymap.del('n', 'j')
					 end
				  end, { desc = 'wrap' } },
				  { 'c', function()
					 if vim.o.cursorline == true then
						vim.o.cursorline = false
					 else
						vim.o.cursorline = true
					 end
				  end, { desc = 'cursor line' } },

				  { '<esc>', nil, { exit = true } },
				  {	'<tab>', ':edit ~/.config/nvim/lua/plugins/hydra.lua', { desc = 'config' } }
			   }
		   })
	end}
}
