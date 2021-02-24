" General
exe 'source '.stdpath('config').'/general.vim'
exe 'source '.stdpath('config').'/keys.vim'

if !exists('g:vscode')
  " Plugin
  exe 'source '.stdpath('config').'/plugins.vim'

  " Theme
  exe 'source '.stdpath('config').'/theme.vim'
endif
