set nocompatible              " be iMproved, required
filetype off                  " required
syntax on


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" Syntax Highlighting
Plugin 'rodjek/vim-puppet'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'elzr/vim-json'

" IDE features
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " required

" Some useful mappings.
map ,L    :let @z=TimeStamp()<Cr>"zpa
map ,datetime :let @z=strftime("%Y %b %d %X")<Cr>"zpa
map ,date :let @z=strftime("%Y %b %d")<Cr>"zpa

" Set new files containing a shebang to have the executable bit
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif


" For newly created Python files, sets a header
if has("autocmd")
  augroup content
    autocmd BufNewFile *.py
       \ 0put = '#!/usr/bin/env python'  |
       \ 1put = '#-*- coding: utf-8 -*-' |
       \ $put = '# Author: Matt Flannery' |
       \ $put = '' |
       \ $put = '# vim: set sw==3 tw=80 :' |
       \ $put = '' |
       \ $put = '' |
       \ norm gg19jf]
  augroup END
endif

" Code folding
set foldmethod=indent
set foldlevel=99
" Enable remaps the default unfold map from za to spacebar
nnoremap <space> za

let python_highlight_all=1

set ts=4
set autoindent
set expandtab
set shiftwidth=4
set cursorline
set showmatch


" Set encoding
set encoding=utf-8

" Some logic to decide which colour scheme to use
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Map F5 to change colour
call togglebg#map("<F5>")

" Turn off these really annoying files
set noswapfile
