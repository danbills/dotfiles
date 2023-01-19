
local api = vim.api
local cmd = vim.cmd

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.tf", "*.tfvars"},
	command = "set filetype=hcl",
})

-- local function map(mode, lhs, rhs, opts)
  -- local options = { noremap = true, silent = true }
  -- if opts then
    -- options = vim.tbl_extend("force", options, opts)
  -- end
  -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- vim.keymap.set({'n', 'v'}, '<leader>lr', vim.lsp.buf.references, { buffer=true })
vim.keymap.set({'n', 'v'}, 'g<space>', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer=true })

-- Need this for pretty folds
-- vim.o.foldmethod='expr'
-- vim.o.foldexpr='nvim_treesitter#foldexpr()'

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})

local options = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>:FuzzyOpen<CR>", options)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
-- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
-- vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
-- vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
vim.api.nvim_set_keymap("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", options)
vim.api.nvim_set_keymap("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], options)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>', options)
vim.api.nvim_set_keymap("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]], options) -- all workspace diagnostic, optionss
vim.api.nvim_set_keymap("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]], options) -- all workspace error, optionss
vim.api.nvim_set_keymap("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]], options) -- all workspace warning, optionss
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", options) -- buffer diagnostics onl, optionsy
vim.api.nvim_set_keymap("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>", options)
vim.api.nvim_set_keymap("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>", options)



-- map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
-- vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.number = true
-- Setup nvim-cmp.
local cmp = require'cmp'


cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

require('incline')
-- require('incline').setup {
--   render = function(props)
  --   local bufname = vim.api.nvim_buf_get_name(props.buf)
    -- return vim.fn.fnamemodify(bufname, ':.')
--   end
-- }


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- use 'mitchellh/tree-sitter-hcl'

  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'preservim/nerdtree'
  use 'mfussenegger/nvim-jdtls'
  use 'mhinz/vim-grepper'
  use 'tpope/vim-commentary'
  use 'f-person/git-blame.nvim'
  use 'mfussenegger/nvim-fzy'
  use 'cloudhead/neovim-fuzzy'
  use "b0o/incline.nvim"
  use 'MichaHoffmann/tree-sitter-hcl'
  use "lukas-reineke/indent-blankline.nvim"
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  use "tpope/vim-fugitive"

  require('fzy')

  vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>:lua fzy.execute('fd', fzy.sinks.edit_file)<CR>", options)
  vim.api.nvim_set_keymap("n", "<leader>fb","<cmd>:lua fzy.actions.buffers()<CR>", options)
  vim.api.nvim_set_keymap("n", "<leader>ft","<cmd>:lua fzy.try(fzy.actions.lsp_tags, fzy.actions.buf_tags)<CR>", options)
  vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>:lua fzy.execute('git ls-files', fzy.sinks.edit_file)<CR>", options)
  vim.api.nvim_set_keymap("n", "<leader>fq", "<cmd>:lua fzy.actions.quickfix()<CR>", options)
  vim.api.nvim_set_keymap("n", "<leader>f/", "<cmd>:lua fzy.actions.buf_lines()<CR>", options)
  vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>lua fzy.execute('ag --nobreak --noheading .', fzy.sinks.edit_live_grep)<CR>", options)

  require("no-neck-pain").setup({
      buffers = {
	  right = {
	      enabled = false,
	  },
      },
  })
  require'lspconfig'.pyright.setup{}



    require'nvim-treesitter.configs'.setup {                                                            
    -- A list of parser names, or "all"                                                            
    ensure_installed = { "java", "lua", "scala", "hcl" },                                                            
                                                            
    -- Install parsers synchronously (only applied to `ensure_installed`)                                                            
    sync_install = false,                                                            
                                                            
    -- List of parsers to ignore installing (for "all")                                                            
    ignore_install = { "javascript" },                                                            
                                                            
    highlight = {                                                                                                                                                          
      -- `false` will disable the whole extension                                                                                                                          
      enable = true,                                                                                                                                                       
                                                                                                                                                                           
      -- list of language that will be disabled                                                                                                                            
      disable = { "c", "rust" },                                                                                                                                           
                                                                                                                                                                           
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.                                                                                       
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).                                                                                
      -- Using this option may slow down your editor, and you may see some duplicate highlights.                                                                           
      -- Instead of true it can also be a list of languages                                                                                                                
      additional_vim_regex_highlighting = false,                                                                                                                           
    },                                                                                                                                                                     
  }

  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
      use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
	  "startup-nvim/startup.nvim",
	  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	  config = function()
	    require"startup".setup()
	  end
	}

    require"startup".setup()
    use { 'anuvyklack/pretty-fold.nvim',
   requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
   -- config = function()
      -- require('pretty-fold').setup()
      -- require('pretty-fold.preview').setup()
   -- end
}

-- require('pretty-fold').setup(config: table)

 -- require('pretty-fold').setup()


  local metals_config=require("metals").bare_config()
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc()'
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    --
    pattern = { "scala", "sbt", "sc" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })
end)



--[[
local function on_attach(client, bufnr)

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end
]]


--[[
nnoremap <silent><leader>ff :lua fzy.execute('fd', fzy.sinks.edit_file)<CR>
nnoremap <silent><leader>fb :lua fzy.actions.buffers()<CR>
nnoremap <silent><leader>ft :lua fzy.try(fzy.actions.lsp_tags, fzy.actions.buf_tags)<CR>
nnoremap <silent><leader>fg :lua fzy.execute('git ls-files', fzy.sinks.edit_file)<CR>
nnoremap <silent><leader>fq :lua fzy.actions.quickfix()<CR>
nnoremap <silent><leader>f/ :lua fzy.actions.buf_lines()<CR>
nnoremap <silent><leader>fl :lua fzy.execute('ag --nobreak --noheading .', fzy.sinks.edit_live_grep)<CR>

nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-h> :lua vim.lsp.buf.hover()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap <space>ca :lua vim.lsp.buf.code_action()<CR>

setl omnifunc=v:lua.vim.lsp.omnifunc

autocmd FileType fuzzy tnoremap <silent> <buffer> <C-T> <C-\><C-n>:FuzzyOpenFileInTab<CR>
autocmd FileType fuzzy tnoremap <silent> <buffer> <C-S> <C-\><C-n>:FuzzyOpenFileInSplit<CR>
autocmd FileType fuzzy tnoremap <silent> <buffer> <C-V> <C-\><C-n>:FuzzyOpenFileInVSplit<CR>

set relativenumber


" autocmd FileType scala,sbt
" colorscheme kanagawa
]]
