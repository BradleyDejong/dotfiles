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
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-vinegar')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('junegunn/fzf', {'do': {-> system('./install --bin')}})
call minpac#add('junegunn/fzf.vim', {'do': {-> system('./install --bin')}})
call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('janko-m/vim-test')
call minpac#add('editorconfig/editorconfig-vim')
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

source $HOME/.config/nvim/deoplete.vim
source $HOME/.config/nvim/language-client.vim
source $HOME/.config/nvim/appearance.vim
source $HOME/.config/nvim/grepper.vim
source $HOME/.config/nvim/terminal-setup.vim
source $HOME/.config/nvim/ale-setup.vim

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "helptags " . g:opamshare . "/merlin/vim/doc"
