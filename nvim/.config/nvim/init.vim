filetype plugin indent on

set runtimepath+=~/.npm/bin

luafile ~/.config/nvim/plugin-setup.lua

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

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

luafile ~/.config/nvim/language-client.lua

nnoremap <leader>ed <cmd>e ~/dotfiles/nvim/.config/nvim/init.vim<cr>

luafile ~/.config/nvim/startup.lua
luafile ~/.config/nvim/telescope.lua
luafile ~/.config/nvim/plugin-config.lua

nnoremap <leader>R :lua package.loaded["partiallypractical.telescope"] = nil <cr>:source ~/.config/nvim/init.vim <cr>
