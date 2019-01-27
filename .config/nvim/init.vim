set nocompatible
filetype plugin indent on
set relativenumber

set runtimepath+=~/.npm/bin

packadd minpac

call minpac#init()

call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-obsession')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-dispatch')
call minpac#add('elmcast/elm-vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-vinegar')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('junegunn/fzf', {'do': {-> system('./install --bin')}})
call minpac#add('junegunn/fzf.vim', {'do': {-> system('./install --bin')}})
call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('janko-m/vim-test')
call minpac#add('editorconfig/editorconfig-vim')
" call minpac#add('JalaiAmitahl/maven-compiler.vim')
call minpac#add('KeitaNakamura/neodark.vim')
call minpac#add('ryanoasis/vim-devicons')
let test#strategy = "dispatch"

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackList echo join(minpac#getpackages("minpac", "start"), "\n")

nnoremap <C-p> :<C-u>FZF<CR>

" window switching helpers
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

if has('nvim')
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
endif

"undo persistence
set undofile
set undodir=$VIMDATA/undo
call mkdir(&undodir, 'p')


augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

"source $HOME/.config/nvim/deoplete.vim
"source $HOME/.config/nvim/language-client.vim
source $HOME/.config/nvim/appearance.vim
source $HOME/.config/nvim/grepper.vim
source $HOME/.config/nvim/terminal-setup.vim
"source $HOME/.config/nvim/ale-setup.vim
source $HOME/.config/nvim/groovy-test.vim

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

call minpac#add('neoclide/coc.nvim')

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf  <Plug>(coc-fix-current)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set cmdheight=2
" Find symbol of current document
nmap <leader>o  :<C-u>CocList outline<cr>
