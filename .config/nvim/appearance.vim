call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('altercation/vim-colors-solarized')
colorscheme solarized
set bg=dark
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


" Terminal cursor helpers
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif
