call plug#begin(stdpath('data') . '/plugged')
" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'
" File
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mkitt/tabline.vim'
" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'Shougo/neosnippet.vim'
" Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Git
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
" Looks and niceties
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Color theme molokai
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
let g:airline_theme = 'base16_monokai'
let g:airline_powerline_fonts = 1
" Colors for tabline
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" Line nubers
set number
set relativenumber
"Switch to show absolute line numbers when window not in focus
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained * set relativenumber
	autocmd BufLeave,FocusLost   * set norelativenumber
augroup END

" Mouse
set mouse=a

" Tab size
set tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType python set tabstop=2 tabstop=2 expandtab

" Neovim LSP configuration
lua <<EOF
	local nvim_lsp = require'nvim_lsp'
	-- GOPLS
	nvim_lsp.gopls.setup{on_attach=require'completion'.on_attach}
	
	-- Haskell language server
	require'nvim_lsp'.hls.setup{on_attach=require'completion'.on_attach}

EOF

" Completion.nvim config
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_ignore_case = 1

let g:completion_enable_snippet = 'Neosnippet'
let g:neosnippet#disable_runtime_snippets = {'_' : 1}

" Go configuration
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Custom mappings
map åf :NERDTreeToggle<CR>
map åt :tabedit 
map åy "+y
map åp "+p

" Misc. Preferences
set cursorline
set cmdheight=2
set ignorecase
