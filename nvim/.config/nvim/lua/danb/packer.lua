-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- use ( 'mfussenegger/nvim-jdtls' )
  -- use ('nvim-telescope/telescope-fzy-native.nvim' )
  -- use ('hashivim/vim-terraform')
  -- use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

  use ( 'hrsh7th/nvim-cmp' )
  use ( 'hrsh7th/cmp-nvim-lsp' )
  use ( 'hrsh7th/cmp-buffer' )
  use ( 'hrsh7th/cmp-cmdline' )

  use ( 'L3MON4D3/LuaSnip' )
  use ( 'vim-airline/vim-airline' )
  -- use ( 'f-person/git-blame.nvim' )
  --
  use ( 'godlygeek/tabular')
  use ( 'tpope/vim-commentary' )
  -- use 'preservim/vim-markdown' 

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })

  use ( 'preservim/nerdtree' )

  use ('tpope/vim-fugitive')

  use {
	  "folke/trouble.nvim",
	  requires = "nvim-tree/nvim-web-devicons",
	  config = function()
		  require("trouble").setup {
			  -- your configuration comes here
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
		  }
	  end 
  }

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use ( 'github/copilot.vim' )



end)

