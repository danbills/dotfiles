require'lspconfig'.pyright.setup{}

require'lspconfig'.terraformls.setup{}
require'lspconfig'.tflint.setup{}

vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])


require'lspconfig'.groovyls.setup{
    -- Unix
    cmd = { "java", "-jar", "/Users/dbillings/groovy-language-server/build/libs/groovy-language-server-all.jar" },
    ...
}

