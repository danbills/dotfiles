vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set({'n', 'v'}, 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer=true })

vim.keymap.set('n', '[', '<cmd>:bprev<CR>')
vim.keymap.set('n', ']', '<cmd>:bnext<CR>')
vim.keymap.set('n', '<Esc>', '<nop>')

-- vim.api.nvim_set_keymap("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>", options)
-- vim.api.nvim_set_keymap("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>", options)


