-- automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


local plugins = function(use) 

	use 'kaicataldo/material.vim'
	
end

local packer = require('packer').startup(plugins)

-- configure plugins
require("plugins.config")

return packer
