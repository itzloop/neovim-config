local set_key = vim.api.nvim_set_keymap


-- set the leader key to <Space>
set_key("n", "<Space>", "<NOP>", { noremap = true, silent = true } )
vim.g.mapleader = " "

set_key("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true} )
