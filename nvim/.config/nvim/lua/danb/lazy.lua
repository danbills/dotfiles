local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  'nvim-treesitter/nvim-treesitter-textobjects',
  "mfussenegger/nvim-jdtls",
  "nvim-telescope/telescope-fzy-native.nvim",
  "hashivim/vim-terraform",
  "scalameta/nvim-metals",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
--  "L3MON4D3/LuaSnip",
  "vim-airline/vim-airline",
  "f-person/git-blame.nvim",
  "godlygeek/tabular",
  "tpope/vim-commentary",
  "neovim/nvim-lspconfig",
  "ckipp01/nvim-jenkinsfile-linter",
  "preservim/nerdtree",
  "tpope/vim-fugitive",
  "folke/trouble.nvim",
  "akinsho/bufferline.nvim",
  "github/copilot.vim",
  "joshuavial/aider.nvim",
  "nvim-tree/nvim-web-devicons",
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  {
    'mrcjkb/haskell-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    version = '^2', -- Recommended
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
}

require("lazy").setup(plugins, opts)
