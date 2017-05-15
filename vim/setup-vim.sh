#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.vim/colors

git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone https://github.com/gavocanov/vim-js-indent.git ~/.vim/bundle/vim-js-indent

git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
(cd ~/.vim/bundle/vimproc.vim ; make)

git clone https://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib_vim
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/bundle/vim-addon-mw-utils
git clone https://github.com/garbas/vim-snipmate.git ~/.vim/bundle/vim-snipmate
git clone https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets
git clone git://github.com/tpope/vim-unimpaired.git ~/.vim/bundle/vim-unimpaired

git clone https://github.com/Quramy/tsuquyomi.git ~/.vim/bundle/tsuquyomi

curl -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim

git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim

