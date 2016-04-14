set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
" Syntax Highlighting
Plugin 'rodjek/vim-puppet'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'elzr/vim-json'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set showmatch	
set autoindent	
set shiftwidth=2	
set smartindent	
set smarttab	
set softtabstop=2

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

