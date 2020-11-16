call plug#begin(stdpath('data') . '/plugged')
" Basics
Plug 'roy2220/easyjump.tmux'
Plug 'tpope/vim-surround'
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

" airline color config
let g:airline_theme = 'base16_monokai'
let g:airline_powerline_fonts = 1

" vim-go configuration
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

