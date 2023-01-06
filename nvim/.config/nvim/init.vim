set nocompatible
filetype plugin indent on
set relativenumber
set number
set scrolloff=8

set runtimepath+=~/.npm/bin

set packpath^=~/.vim
packadd minpac

call minpac#init()

call minpac#add('sbdchd/neoformat')
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-obsession')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-dispatch')
call minpac#add('elmcast/elm-vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-vinegar')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('KeitaNakamura/neodark.vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('kyazdani42/nvim-web-devicons')
call minpac#add('folke/which-key.nvim')
call minpac#add('elianiva/telescope-npm.nvim')
call minpac#add('rose-pine/neovim')


" Vim test plugin and setup
call minpac#add('vim-test/vim-test')
"
let test#strategy = "dispatch"
let g:test#enabled_runners = ["javascript#jest"]
augroup test
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackList echo join(minpac#getpackages("minpac", "start"), "\n")

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
source $HOME/.config/nvim/grepper.vim
source $HOME/.config/nvim/terminal-setup.vim
source $HOME/.config/nvim/groovy-test.vim

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

source $HOME/.config/nvim/completion-lsp.vim
call minpac#add('neovim/nvim-lspconfig')

" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set cmdheight=2

call minpac#add('raichoo/purescript-vim')

luafile ~/.config/nvim/language-client.lua

call minpac#add("nvim-lua/popup.nvim")
call minpac#add("nvim-treesitter/nvim-treesitter")
call minpac#add("nvim-lua/plenary.nvim")
call minpac#add("nvim-telescope/telescope.nvim")
call minpac#add("nvim-telescope/telescope-file-browser.nvim")
call minpac#add("nvim-telescope/telescope-fzy-native.nvim")
call minpac#add("nvim-telescope/telescope-node-modules.nvim")

nnoremap <leader>ed <cmd>e ~/dotfiles/nvim/.config/nvim/init.vim<cr>

luafile ~/.config/nvim/startup.lua
luafile ~/.config/nvim/telescope.lua
luafile ~/.config/nvim/plugin-config.lua

nnoremap <leader>R :lua package.loaded["partiallypractical.telescope"] = nil <cr>:source ~/.config/nvim/init.vim <cr>
