" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" More scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" exit terminal mode
tnoremap <C-+><C-n> <C-\><C-n>

" Tabbing keeps visual selection
vnoremap < <gv
vnoremap > >gv

" Custom mappings
map åt :tabedit 
map åy "+y
map åp "+p
map åP "+P

" Snippet shortcuts
imap <C-k>  <Plug>(deoppet_expand)
imap <C-f>  <Plug>(deoppet_jump_forward)
imap <C-b>  <Plug>(deoppet_jump_backward)
smap <C-f>  <Plug>(deoppet_jump_forward)
smap <C-b>  <Plug>(deoppet_jump_backward)

" Autocomplete Pop-up-menu
nmap K :lua vim.lsp.buf.hover()<CR>

" Adding lines in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

if exists('g:vscode')
  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
endif
