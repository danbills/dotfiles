vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set({'n', 'v'}, 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer=true })
vim.keymap.set("n", "N", "<cmd>lua vim.diagnostic.goto_next()<CR>")

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>" )
vim.keymap.set('n', '<Esc>', '<nop>')


