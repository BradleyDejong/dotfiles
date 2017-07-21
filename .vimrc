source $HOME/.vim/plug.vim

syntax on
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

noremap <silent> ]l :lnext<CR>
noremap <silent> [l :lprev<CR>
noremap <silent> ]q :cnext<CR>
noremap <silent> [q :cprev<CR>
noremap <silent> [Q :cfirst<CR>
noremap <silent> [Q :clast<CR>

if has("gui_running")
  set background=light
else
  set background=dark
endif
colorscheme solarized


"<Leader>n breaks apart the quote
:nmap <Leader>n i" +<CR>"<ESC>
:nmap <Leader>N i' +<CR>'<ESC>

:map <Leader>t <F5>
:map <Leader>d I✓<ESC>
:map <Leader>c I*<ESC>
:map <Leader>f :echo @%<CR>

set wildignore+=*/target/*
set wildignore+=*/reveal-javaweb/bin/*
set wildignore+=*/bin/*
set wildignore+=*.class

:map <Leader>bb :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {'dir':'\v[\/](tmp|lib|docs|dist|coverage|typings|bower_components|elm-stuff|node_modules|target|build|bin)$'}

highlight ColorColumn ctermbg=magenta
highlight ColorColumn guibg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
endif

set ruler
set relativenumber
set number

set statusline+=%#warningmsg#
set statusline+=%*

set timeoutlen=500

autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

set backspace=2
set noswapfile
set backupcopy=yes

set list
set listchars=tab:>\ ,trail:-,extends:»,precedes:«,nbsp:+,eol:↲

let g:vim_markdown_folding_disabled=1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

set laststatus=2
let g:airline#extensions#tabline#enabled = 0

