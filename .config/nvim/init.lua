local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.swapfile = false

-- if lazy doesn't exist, install it
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy >> package manager
require("vim-options")
require("lazy").setup("plugins")
require('lazy.view.config').keys.close = '<Esc>'

vim.keymap.set('n', '<leader>a',  ':lua require("activate").list_plugins()<CR>')
vim.keymap.set('n', '<leader>l',  ':Lazy<CR>')

vim.keymap.set('n', '<A-0>', ':blast<CR>', {})
vim.keymap.set('n', '<A-n>', ':bn<CR>', {})
vim.keymap.set('n', '<A-b>', ':bp<CR>', {})
vim.keymap.set('n', '<A-c>', ':bd<CR>', {})

local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    }) end)
