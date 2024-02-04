filetype plugin indent on

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

source $HOME/.config/nvim/completion-lsp.vim

" don't give |ins-completion-menu| messages.
set shortmess+=c

nnoremap <leader>ed <cmd>e ~/dotfiles/nvim/.config/nvim/init.vim<cr>

lua require("partiallypractical")
