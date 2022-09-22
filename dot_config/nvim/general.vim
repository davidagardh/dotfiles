" Chris Machine general settings chrisatmachine.com/Neovim/02-vim-general-settings/
" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=1                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=1000                     " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
"set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory

" End Chris

" Tab size
set tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType python set tabstop=2 tabstop=2 expandtab

" Line nubers
set number
set relativenumber

" Visible tabs
set listchars=tab:\ 
"set list

" Misc. Preferences
set ignorecase
set scrolloff=5

" Avoid showing message extra message when using completion
set shortmess+=c

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

"Switch to show absolute line numbers when window not in focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber cursorline
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &number | set norelativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set nocursorline
augroup END

autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal wrap
autocmd FileType markdown nnoremap j gj
autocmd FileType markdown nnoremap k gk
autocmd FileType markdown nnoremap _ g0
autocmd FileType markdown nnoremap $ g$

autocmd FileType scala setlocal tabstop=2 shiftwidth=2 expandtab
