set nocompatible
syntax enable
set encoding=utf-8
set showcmd
set number
filetype plugin indent on

"Whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

" from bernhardt: split movement:
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"leader shortcuts
let mapleader = ","
map <leader><leader> <c-^>
map <leader>bp orequire 'pry'; binding.pry <Esc>
map <leader>r :! ruby % <CR>
map <leader>ts :sp ~/Dropbox/tool-sharpening.txt <CR>
map <leader>pn :sp ~/Dropbox/project-notes.txt <CR>
map <leader>ct :!ctags -R --languages=ruby --exclude=.git<cr>
