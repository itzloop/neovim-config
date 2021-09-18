local set_key = vim.api.nvim_set_keymap


-- set the leader key to <Space>
set_key("n", "<Space>", "<NOP>", { noremap = true, silent = true } )
set_key("n", "<C-Space>", "<NOP>", { noremap = true, silent = true } )
vim.g.mapleader = " "

set_key("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true} )

-- toggle Lexplore
set_key("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true} )


-- better windows movement
set_key("n", "<C-h>", "<C-w>h", { silent = true} )
set_key("n", "<C-j>", "<C-w>j", { silent = true} )
set_key("n", "<C-l>", "<C-w>l", { silent = true} )
set_key("n", "<C-k>", "<C-w>k", { silent = true} )


-- exit out of insert mode easier
set_key("i", "jk", "<Esc>", { noremap = true, silent = true} )
set_key("i", "kj", "<Esc>", { noremap = true, silent = true} )

-- better indentation control
set_key("v", "<", "<gv", { noremap = true, silent = true} )
set_key("v", ">", ">gv", { noremap = true, silent = true} )

-- Tab buffer switch
set_key("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true} )
set_key("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true} )

-- Move selected line in visual mode
set_key("x", "J", ":move '>+1<CR>gv-gv'", { noremap = true, silent = true} )
set_key("x", "K", ":move '<-2<CR>gv-gv'", { noremap = true, silent = true} )

