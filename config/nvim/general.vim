" Tab size
set tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType python set tabstop=2 tabstop=2 expandtab

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

" Misc. Preferences
set cursorline
set cmdheight=2
set ignorecase

" Avoid showing message extra message when using completion
set shortmess+=c

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

