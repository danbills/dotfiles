vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set({'n', 'v'}, 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer=true })


