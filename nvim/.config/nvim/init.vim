set nocompatible
filetype plugin indent on
set relativenumber
set number
set scrolloff=8

set runtimepath+=~/.npm/bin

set packpath^=~/.vim

luafile ~/.config/nvim/plugin-setup.lua

"packadd minpac

"call minpac#init()

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Vim test plugin and setup
"let test#strategy = "dispatch"
"let g:test#enabled_runners = ["javascript#jest"]
"augroup test
  "autocmd!
  "autocmd BufWrite * if test#exists() |
    "\   TestFile |
    "\ endif
"augroup END

"command! PackUpdate call minpac#update()
"command! PackClean call minpac#clean()
"command! PackList echo join(minpac#getpackages("minpac", "start"), "\n")

" Add break points for undos
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap / /<c-g>u

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

source $HOME/.config/nvim/appearance.vim
source $HOME/.config/nvim/terminal-setup.vim
source $HOME/.config/nvim/groovy-test.vim

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

source $HOME/.config/nvim/completion-lsp.vim

" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set cmdheight=2

luafile ~/.config/nvim/language-client.lua

nnoremap <leader>ed <cmd>e ~/dotfiles/nvim/.config/nvim/init.vim<cr>

luafile ~/.config/nvim/startup.lua
luafile ~/.config/nvim/telescope.lua
luafile ~/.config/nvim/plugin-config.lua

nnoremap <leader>R :lua package.loaded["partiallypractical.telescope"] = nil <cr>:source ~/.config/nvim/init.vim <cr>
