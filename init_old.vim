
" **************************
" *   START INIT PLUGINS   *
" **************************
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" lsp
" Plug 'neovim/nvim-lspconfig'

" A port of the Material color scheme for Vim/Neovim.
" Plug 'kaicataldo/material.vim', { 'branch': 'main' } 

" Install nvim-cmp
" Plug 'hrsh7th/nvim-cmp'

" Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
" Plug 'hrsh7th/vim-vsnip'

" Install the buffer completion source
" Plug 'hrsh7th/cmp-buffer'

" NERDTree
" Plug 'preservim/nerdtree'

" for adding brackets quotes and... around words
" Plug 'jiangmiao/auto-pairs'

" Git
" Plug 'tpope/vim-fugitive'

" for commenting out lines functions and etc...
" Plug 'preservim/nerdcommenter'
call plug#end()

" **************************
" *    END INIT PLUGINS    * 
" **************************

lua << EOF
vim.lsp.set_log_level("debug")  
require('lspconfig')['gopls'].setup{}
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
   mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  } 
})

EOF

" luafile $HOME/.config/nvim/configs/plugins/autocomp/init.lua
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
" **************************
" * START MATERIAL CONFIGS *
" **************************
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
" if (has('nvim'))
"   let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
" endif


" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

" let g:material_theme_style = 'default' 
"				  | 'palenight' 
"				  | 'ocean' 
"				  | 'lighter' 
"				  | 'darker' 
"				  | 'default-community' 
"				  | 'palenight-community' 
"				  | 'ocean-community' 
"				  | 'lighter-community' 
"				  | 'darker-community'

let g:material_theme_style = 'ocean'
let g:material_terminal_italics = 1
colorscheme material
" **************************
" * END MATERIAL CONFIGS *
" **************************

" **************************
" *    START GO CONFIGS    * 
" **************************

au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1

let g:go_fmt_command = "goimports"




" **************************
" *    END GO CONFIGS      * 
" **************************

" **************************
" *  START LINTER CONFIGS  * 
" **************************
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1



" **************************
" *  END LINTER CONFIGS    * 
" **************************
" **************************
" *START COMMENTER CONFIGS * 
" **************************

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1



" **************************
" * END COMMENTER CONFIGS  *    
" **************************
