call minpac#add('Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
let g:deoplete#enable_at_startup = 1

" call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" set sources
let g:deoplete#sources = {}
let g:deoplete#sources.javascript = ['LanguageClient']
let g:deoplete#sources.typescript = ['LanguageClient']
let g:deoplete#sources.vim = ['vim']

" Disable the candidates in Comment/String syntaxes.
