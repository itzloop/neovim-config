-- automatically run :PackerCompile whenever plugins.lua is updated
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])


local plugins = function(use)
  use 'wbthomason/packer.nvim'
	use 'kaicataldo/material.vim'

  -- removed in favor of telescope file_browser
  -- use {
	--     	'kyazdani42/nvim-tree.lua',
	--     		requires = 'kyazdani42/nvim-web-devicons'
	-- }

	-- native lsp plugin
	use 'neovim/nvim-lspconfig'

	-- completion plugin
	use {
	  "hrsh7th/nvim-cmp",
	  requires = {
	    "hrsh7th/vim-vsnip",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-vsnip"
	  }
	}

  -- treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'} }
  }
  -- TODO
  -- install fzf on terminal

  -- install some plugins for comenting
  use 'terrortylor/nvim-comment'

  -- auto pairs
  use 'jiangmiao/auto-pairs'
  -- tabline up top
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- terminal management
  use { "akinsho/toggleterm.nvim" }

  use { "kyazdani42/nvim-web-devicons" }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }

  -- color highlights
  use { 'norcalli/nvim-colorizer.lua' }

  -- markdown preview
  use { 'iamcco/markdown-preview.nvim' }

  -- latex preview
  use { 'xuhdev/vim-latex-live-preview' }

  use { 'tpope/vim-fugitive' }
end

local packer = require('packer').startup(plugins)

-- configure plugins
require("plugins.init")

return packer
