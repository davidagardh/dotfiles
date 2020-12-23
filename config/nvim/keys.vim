" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" More scrolling
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

" exit terminal mode with escape
tnoremap <ESC> <C-\><C-n>

" Tabbing keeys visual selection
vnoremap < <gv
vnoremap > >gv

" Custom mappings
map åf :NERDTreeToggle<CR>
map åt :tabedit 
map åy "+y
map åp "+p
map åP "+P

" Adding lines in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Go mappings
autocmd FileType go map <C-n> :cnext<CR>
autocmd FileType go map <C-m> :cprevious<CR>
autocmd FileType go nnoremap <Leader>a :cclose<CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>b <Plug>(go-build)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>l <Plug>(go-lint)
autocmd FileType go nmap <leader>d <Plug>(go-def)

" Autocomplete/snippets
nmap K :lua vim.lsp.buf.hover()<CR>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

