local api = vim.api
local cmd = vim.cmd

vim.wo.relativenumber = true
-- set foldenable to false globally
vim.wo.foldenable = false
-- vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
-- set shiftwidth to 2
vim.bo.shiftwidth = 2
vim.go.shiftwidth = 2
vim.opt.completeopt = { "menu" }
vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

