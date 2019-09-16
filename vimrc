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
"
if has('python3')
  silent! python3 1
endif

execute pathogen#infect()

filetype off
call pathogen#incubate()
call pathogen#helptags()

syntax on
filetype plugin indent on

set mouse=a
set wildmode=longest,list,full

" rusty-tags
" autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
" autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

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

nn <C-r> :CtrlPBuffer<cr>

set completeopt-=preview

set number
set relativenumber
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
" colorscheme elflord
" color dracula

autocmd bufreadpre *.mako setlocal autoindent
autocmd bufreadpre *.tpl set filetype=html
autocmd bufreadpre *.hbs set filetype=html
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> bd ((getcmdtype() is# ':' && getcmdline() is# 'bd')?('Bdelete'):('bd'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! FindPrompt()
    let str = input("Search: ", "")
    if str == ""
        return
    endif

    :silent! execute "Ag '" . str . "'"
    :cw
endfunction

function! FindWordNoFilter()
    let str = expand("<cword>")
    if str == ""
        return
    endif

    :silent! execute "Ag '" . str . "'"
    :cw
endfunction

function! DeleteAllLinesWithThisWord()
    let str = expand("<cword>")
    if str == ""
        return
    endif
    :silent! execute "g/" . str . "/d"
endfunction

function! FindWord()
    let str = expand("<cword>")
    if str == ""
        return
    endif

    :silent! execute "Ag '" . str . "'"
    :cw
endfunction

map <F3> :call FindWord()<CR>
" map <F4> :call FindWordNoFilter()<CR>
nmap <C-f> :call FindPrompt()<CR>
nmap <F9> :set autowrite<CR>:cp<CR>:set noautowrite<CR>zz
nmap <F10> :set autowrite<CR>:cn<CR>:set noautowrite<CR>zz


"""""""



"""" bad whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

autocmd BufNewFile,BufRead /Users/eran/Projects/elad/* set noexpandtab tabstop=4 shiftwidth=4
let g:jedi#show_call_signatures = "0"




let g:ycm_confirm_extra_conf = 0

set splitbelow
set splitright


" TagBar
nmap <F8> :TagbarToggle<CR>
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_powerline_fonts = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1


""" TODO
" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" " Disable Arrow keys in Insert mode

" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" Window keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" per-project config support
if filereadable("_local_vimrc")
    source _local_vimrc
endif

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
