call plug#begin(stdpath('data') . '/plugged')
" Basics
Plug 'roy2220/easyjump.tmux'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'cohama/lexima.vim'
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
Plug 'airblade/vim-gitgutter'
" Looks and niceties
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" airline color config
let g:airline_theme = 'base16_monokai'
let g:airline_powerline_fonts = 1

" vim-go configuration
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Enable and configure rainbow brackets
let g:rainbow_active = 1

" Neovim LSP configuration
lua <<EOF
	local nvim_lsp = require'nvim_lsp'
	-- GOPLS
	nvim_lsp.gopls.setup{on_attach=require'completion'.on_attach}
	
	-- Haskell language server
	--require'nvim_lsp'.hls.setup{on_attach=require'completion'.on_attach}
EOF

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_ignore_case = 1
let g:completion_enable_auto_paren = 1

let g:completion_enable_snippet = 'Neosnippet'
let g:neosnippet#disable_runtime_snippets = {'_' : 1}

