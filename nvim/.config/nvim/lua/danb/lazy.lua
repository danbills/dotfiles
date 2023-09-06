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
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  "mfussenegger/nvim-jdtls",
  "nvim-telescope/telescope-fzy-native.nvim",
  "hashivim/vim-terraform",
  "scalameta/nvim-metals",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  "vim-airline/vim-airline",
  "f-person/git-blame.nvim",
  "godlygeek/tabular",
  "tpope/vim-commentary",
  "preservim/vim-markdown",
  "neovim/nvim-lspconfig",
  "ckipp01/nvim-jenkinsfile-linter",
  "preservim/nerdtree",
  "tpope/vim-fugitive",
  "folke/trouble.nvim",
  "akinsho/bufferline.nvim",
  "github/copilot.vim",
  "nvim-tree/nvim-web-devicons",
}

require("lazy").setup(plugins, opts)
