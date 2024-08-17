-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp",
	requires = { { 'rafamadriz/friendly-snippets'} },

  })

  use {
	  "startup-nvim/startup.nvim",
	  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	  config = function()
	    require"startup".setup()
	  end
	}
  use {
		'w0rp/ale',
		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}


  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/nvim-cmp'


  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

  use 'rstacruz/vim-closer'
  use 'mattn/emmet-vim'

  use ('mbbill/undotree')
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  
  use 'rbong/vim-flog'
  use 'tpope/vim-unimpaired'
  use 'preservim/tagbar'
  use 'jiangmiao/auto-pairs'
  use 'frazrepo/vim-rainbow'
  use "nvim-lua/plenary.nvim"
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  vim.api.nvim_command("let g:airline#extensions#tabline#enabled = 1")
  vim.api.nvim_command("let g:airline#extensions#tabline#formatter = 'default'")
  use 'lambdalisue/battery.vim'
  vim.api.nvim_command("let g:airline#extensions#battery#enabled = 1")
  use 'preservim/nerdtree'

end)
