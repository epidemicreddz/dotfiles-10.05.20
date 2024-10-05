vim.g.mapleader = " "
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nowrap")
vim.cmd("set number")
vim.o.cursorline = true
vim.opt.showmode = false
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.api.nvim_set_hl(0, 'Comment', { italic=true }) -- awesome
