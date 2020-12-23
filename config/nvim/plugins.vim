call plug#begin(stdpath('data') . '/plugged')
" Basics
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'luochen1990/rainbow'
Plug 'cohama/lexima.vim'
" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'
Plug 'justinmk/vim-sneak'
" File
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Languages
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Looks and niceties
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

" Enable and configure rainbow brackets
let g:rainbow_active = 1

" vim-go configuration
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_doc_keywordprg_enabled = 0
let g:go_echo_go_info = 0

" LSP config
lua <<EOF
require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
EOF

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Snippets
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
