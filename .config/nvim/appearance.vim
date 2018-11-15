call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('altercation/vim-colors-solarized')
call minpac#add('romainl/Apprentice')
colorscheme apprentice
set bg=dark
let g:airline_theme='molokai'
let g:airline_solarized_bg='dark'


" Terminal cursor helpers
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

