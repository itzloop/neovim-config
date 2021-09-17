-- automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


local plugins = function(use) 

	use 'kaicataldo/material.vim'
	use {
	    	'kyazdani42/nvim-tree.lua',
    		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- native lsp plugin
	use 'neovim/nvim-lspconfig' 

	-- completion plugin
	use {
	  "hrsh7th/nvim-cmp",
	  requires = {
	    "hrsh7th/vim-vsnip",
	    "hrsh7th/cmp-buffer",
	  }
	}
end

local packer = require('packer').startup(plugins)

-- configure plugins
require("plugins.config")

return packer
