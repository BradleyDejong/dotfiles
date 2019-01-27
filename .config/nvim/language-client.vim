
" language server stuff
call minpac#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': {-> system('bash install.sh')}})

call minpac#add('reasonml-editor/vim-reason-plus')

set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'haskell': ['hie-wrapper']
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>f :call LanguageClient#textDocument_codeAction()<CR>


