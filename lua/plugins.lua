local plugins = function(use)
  use 'wbthomason/packer.nvim'
	-- use 'kaicataldo/material.vim'

	use 'marko-cerovac/material.nvim'
  -- removed in favor of telescope file_browser
  -- use {
	--     	'kyazdani42/nvim-tree.lua',
	--     		requires = 'kyazdani42/nvim-web-devicons'
	-- }
	--
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use "folke/neodev.nvim"

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}

  -- treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'} }
  }

	use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
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
  -- use {'iamcco/markdown-preview.nvim'}
  -- latex preview
  -- use { 'xuhdev/vim-latex-live-preview' }

  use { 'tpope/vim-fugitive' }

end

local packer = require('packer').startup(plugins)

-- configure plugins
require("plugins.init")
return packer
