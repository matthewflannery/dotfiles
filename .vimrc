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
map ,L    :let @z=TimeStamp()<Cr>"zpa
map ,datetime :let @z=strftime("%d %b %Y %X")<Cr>"zpa

map ,date :let @z=strftime("%d %b %Y")<Cr>"zpa
" Set new files containing a shebang to have the executable bit
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif

if has("autocmd")
  augroup content
    autocmd BufNewFile *.py
       \ 0put = '#!/usr/bin/env python'  |
       \ 1put = '#-*- coding: utf-8 -*-' |
       \ $put = '' |
       \ $put = '' |
       \ $put = '# vim: set sw==3 tw=80 :' |
       \ norm gg19jf]
  augroup END
endif

" Code folding
set foldmethod=indent
set foldlevel=99
" Enable remaps the default unfold map from za to spacebar
nnoremap <space> za
"PEP8 standard indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
" web stack filetypes
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Mark whitespace as bad
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1

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
