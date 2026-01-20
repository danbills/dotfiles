-- Enable LSP servers using the new vim.lsp API (nvim 0.11+)
vim.lsp.enable('pyright')
vim.lsp.enable('terraformls')
vim.lsp.enable('tflint')
vim.lsp.enable('clangd')

vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

-- Groovy LSP with custom config
vim.lsp.config.groovyls = {
    cmd = { "java", "-jar", "/Users/dbillings/groovy-language-server/build/libs/groovy-language-server-all.jar" },
}
vim.lsp.enable('groovyls')

