vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<C-[>', ':bprev<cr>')
vim.keymap.set('n', '<C-]>', ':bnext<cr>')
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")

