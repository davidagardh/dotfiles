call plug#begin(stdpath('data') . '/plugged')
" Basics
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'luochen1990/rainbow'
Plug 'cohama/lexima.vim'
Plug 'lambdalisue/suda.vim'
" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'
Plug 'justinmk/vim-sneak'
" File
Plug 'preservim/nerdtree'
" Languages
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Looks and niceties
Plug 'ryanoasis/vim-devicons'
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

" completion config
lua <<EOF
require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
EOF

autocmd BufEnter *.lua lua require'completion'.on_attach()

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'Neosnippet'
let g:completion_trigger_character = ['.', ':']

" Snippets
let g:neosnippet#disable_runtime_snippets = {'go' : 1}
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Chan completion
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'tabnine', 'snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
let g:completion_auto_change_source = 1
