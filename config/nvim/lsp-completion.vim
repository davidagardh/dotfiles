" Neovim LSP configuration
lua <<EOF
	local nvim_lsp = require'nvim_lsp'
	-- GOPLS
	nvim_lsp.gopls.setup{on_attach=require'completion'.on_attach}
	
	-- Haskell language server
	--require'nvim_lsp'.hls.setup{on_attach=require'completion'.on_attach}

EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <C-k> to do snippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_ignore_case = 1
let g:completion_enable_auto_paren = 1

let g:completion_enable_snippet = 'Neosnippet'
let g:neosnippet#disable_runtime_snippets = {'_' : 1}

