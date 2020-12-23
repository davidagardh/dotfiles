" Colorscheme
colorscheme gotham256

" airline color config
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1

"Switch to show absolute line numbers when window not in focus
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained * set relativenumber cursorline
	autocmd BufLeave,FocusLost   * set norelativenumber nocursorline
augroup END

