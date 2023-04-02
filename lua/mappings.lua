local set_key = vim.keymap.set

-- setting no-ops
set_key("i", "<C-Space>", "<NOP>", { noremap = true, silent = true } )

-- set the leader key to <Space>
set_key("n", "<Space>", "<NOP>", { noremap = true, silent = true } )
vim.g.mapleader = " "

set_key("n", "<Leader>h", ":set hlsearch!<CR>", { noremap = true, silent = true} )

-- toggle Lexplore
-- set_key("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true} )


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

-- Terminal mappings
-- set_key("n", "<Leader>t", ":botright 20sp term://$SHELL<CR>i", { noremap = true, silent = true} )

-- Exit out of terminal mode with jk
set_key("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true} )
set_key("t", "kj", "<C-\\><C-n>", { noremap = true, silent = true} )

-- better window navigation in terminal mode
set_key("t", "<C-h>", "jk<C-w>h", { silent = true} )
set_key("t", "<C-j>", "jk<C-w>j", { silent = true} )
set_key("t", "<C-l>", "jk<C-w>l", { silent = true} )
set_key("t", "<C-k>", "jk<C-w>k", { silent = true} )

-- Find files
set_key("n", "<Leader>ff", ":Telescope find_files<CR>", {noremap = true, silent = true} )
set_key("n", "<Leader>fg", ":Telescope live_grep<CR>", {noremap = true, silent = true} )
set_key("n", "<Leader>fb", ":Telescope buffers<CR>", {noremap = true, silent = true} )
set_key("n", "<Leader>fh", ":Telescope help_tags<CR>", {noremap = true, silent = true} )
set_key("n", "<Leader>@", ":Telescope treesitter<CR>", {noremap = true, silent = true} )

-- explorer
set_key("n", "<Leader>e", ":Telescope file_browser<CR>", {noremap = true, silent = true} )

-- line/block movement
set_key("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, silent = true} )
set_key("v", "K", ":m '<-2<CR>gv=gv", {noremap = true, silent = true} )
set_key("i", "<C-j>", ":<ESC>:m .+1<CR>==", {noremap = true, silent = true} )
set_key("i", "<C-k>", ":<ESC>:m .-2<CR>==", {noremap = true, silent = true} )
set_key("n", "<Leader>j", ":<ESC>:m .+1<CR>==", {noremap = true, silent = true} )
set_key("n", "<Leader>k", ":<ESC>:m .-2<CR>==", {noremap = true, silent = true} )

-- fugitive
set_key("n", "<Leader>gh", ":diffget //2<CR>", { silent = true} )
set_key("n", "<Leader>gl", ":diffget //3<CR>", { silent = true} )
set_key("n", "<Leader>gs", ":G<CR>", { silent = true} )

