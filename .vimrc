set nocompatible
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

"Whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start


"leader shortcuts
let mapleader = ","
map <leader><leader> <c-^>
map ,r :!ruby % <CR>
