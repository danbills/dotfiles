require'lspconfig'.pyright.setup{}

require'lspconfig'.terraformls.setup{}

require'lspconfig'.groovyls.setup{
    -- Unix
    cmd = { "java", "-jar", "/Users/dbillings/groovy-language-server/build/libs/groovy-language-server-all.jar" },
    ...
}

