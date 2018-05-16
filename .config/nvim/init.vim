set nocompatible
filetype plugin indent on
set relativenumber

set runtimepath+=~/.npm/bin

packadd minpac
call minpac#init()


call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-projectionist')
call minpac#add('w0rp/ale')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('junegunn/fzf', {'do': {-> system('./install --bin')}})
call minpac#add('junegunn/fzf.vim', {'do': {-> system('./install --bin')}})
call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('mhinz/vim-grepper')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

nnoremap <C-p> :<C-u>FZF<CR>

let g:ale_linters = {
\  'javascript': ['eslint'],
\}

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_sign_column_always = 1

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <Leader>g :Grepper -tool git<CR>
