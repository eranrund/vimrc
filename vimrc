" Remeber:
" git submodule update --init --recursive
"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code navigation
"  C ] -- Go to tag
"  :pop -- Go back   
"  :tnext, :tprev - next/prev tag
"
"
execute pathogen#infect()

filetype off
call pathogen#incubate()
call pathogen#helptags()

syntax on
filetype plugin indent on

set mouse=a

" :noremap <Leader>t :!~/.vim/ctags-proj.sh<CR>
set tags=./tags;~/
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['tag']
" let g:ctrlp_custom_ignore = { 'dir': '/env$', 'file': '\v\.(pyc)$' }
let g:ctrlp_custom_ignore = 'node_modules'
set wildignore+=*.swp
set wildignore+=*.pyc
set wildignore+=*.png
set wildignore+=*.jpg
set wildignore+=*.jpeg
set wildignore+=*.pyc
set wildignore+=media
set wildignore+=bootstrap-3.0.0


set number
set nocompatible
set laststatus=2
set encoding=utf-8
set ttyfast
set undofile
set undodir=~/.vim/undodir
set backspace=indent,eol,start

set history=50                " keep 50 lines of command line history
set ruler                " show the cursor position all the time
set showcmd                " display incomplete commands
set incsearch                " do incremental searching

" size of a hard tabstop
set tabstop=4
" always uses spaces instead of tab characters
set expandtab
" size of an "indent"
set shiftwidth=4
set softtabstop=4


syntax enable
set t_Co=256
set background=dark
colorscheme molokai 
