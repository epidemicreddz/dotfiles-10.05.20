return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
		vim.keymap.set('n', '<leader>m', ':Mason<CR>, {}')
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = { "lua_ls", "ts_ls", "pyright" }
		})
	end
  },

  {
    "neovim/nvim-lspconfig",
	config = function()
		vim.keymap.set('n', '<leader>;', ':LspInfo<CR>', {})
		vim.keymap.set('n', ',', vim.lsp.buf.hover, {})
		vim.keymap.set('n', '.', vim.lsp.buf.code_action, {})
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.ts_ls.setup({})
  
	end
},
}
