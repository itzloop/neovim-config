-- vim.cmd("syntax enable")                -- Enables syntax highlighing
vim.o.hidden = true                             -- Required to keep multiple buffers open multiple buffers
vim.o.wrap = false                              -- Display long lines as just one line
vim.o.encoding="utf-8"                      -- The encoding displayed
vim.o.pumheight=10                        -- Makes popup menu smaller
vim.o.fileencoding="utf-8"                  -- The encoding written to file
vim.o.ruler = true              			            -- Show the cursor position all the time
vim.o.cmdheight=2                         -- More space for displaying messages
-- vim.o.iskeyword = vim.o.iskeyword .. "-"                      	-- treat dash separated words as a word text object"
vim.o.mouse="a"                             -- Enable your mouse
vim.o.splitbelow = true                          -- Horizontal splits will automatically be below
vim.o.splitright = true                         -- Vertical splits will automatically be to the right
-- vim.o.t_Co = '256'                            -- Support 256 colors
vim.o.conceallevel=0                      -- So that I can see `` in markdown files
vim.o.tabstop=2                           -- Insert 2 spaces for a tab
vim.o.shiftwidth=2                        -- Change the number of space characters inserted for indentation
vim.o.smarttab = true                           -- Makes tabbing smarter will realize you have 2 vs 4
vim.o.expandtab = true                          -- Converts tabs to spaces
vim.o.smartindent = true                        -- Makes indenting smart
vim.o.autoindent = true                         -- Good auto indent
-- vim.o.laststatus= 0                        -- Always display the status line
vim.o.number = true                             -- Line numbers
vim.o.cursorline = true                         -- Enable highlighting of the current line
vim.o.background= "dark"                     -- tell vim what the background color looks like
-- vim.o.showtabline=2                     -- Always show tabs
vim.o.showmode = false                          -- We don't need to see things like -- INSERT -- anymore
-- This is recommended by coc
vim.o.backup = false
vim.o.writebackup = false                       -- This is recommended by coc
vim.o.updatetime=300                      -- Faster completion
vim.o.timeoutlen=500                      -- By default timeoutlen is 1000 ms
-- vim.o.formatoptions = vim.o.formatoptions:gsub("cro", "")                  -- Stop newline continution of comments
vim.o.clipboard= "unnamedplus"               -- Copy paste between vim and everything else
-- vim.o.autochdir                          -- Your working directory will always be the same as your working directory
vim.o.relativenumber = true
-- vim.cmd("au! BufWritePost $MYVIMRC source %")      -- auto source when writing to init.vm alternatively you can run :source $MYVIMRC

-- You can't stop me
-- vim.cmd("cmap w!! w !sudo tee %")
vim.cmd([[augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END]])

-- prefer *tex over others
vim.g.tex_flavor = "latex"
