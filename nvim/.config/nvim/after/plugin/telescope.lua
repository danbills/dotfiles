local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fG', [['<cmd>Telescope live_grep default_text=' . vim.call('expand','<cword>') ]], {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gD', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- vim.keymap.set('n', 'gt', builtin.lsp_type_implementations, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').load_extension('fzy_native')

