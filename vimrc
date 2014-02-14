" Folds code inside a loop if etc with 'za'
"set foldmethod=indent
"set foldlevel=99

" Split screens
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

set ruler
set showmatch
set shiftwidth=4
set tabstop=4
"set smarttab
set cinwords=if,else,while,do,for,switch,case
set autoindent
set smartindent
set title
set textwidth=80
"set number

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase


" Nerdtree commands
map <C-T> <ESC>:NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"

autocmd BufNewFile,BufRead *.inc set filetype=php
autocmd BufNewFile,BufRead *.inc.ros set filetype=php
autocmd BufNewFile,BufRead *.php.ros set filetype=php
autocmd BufNewFile,BufRead *.html.ros set filetype=xml

"set mouse=a
"set ttym=xterm2

source ~/.vimrc-python
"source ~/.vim/colors/Mustang_Vim_Colorscheme_by_hcalves.vim
"source ~/.vim/colors/Vitamins_Vim_Colorscheme_by_hcalves.vim
