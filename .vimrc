syn on
set nocompatible "don't need to keep compatibility with Vi
set ruler
set wrap
set hidden      "improve history and buffer
set history=1000

set tabstop=4 "tabs settings
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set smarttab

"set hlsearch    "I don't actually like highlight search
set incsearch
set wildmode=longest,list

let $PAGER=''   "clear the variable in vim

" Key remappings
imap ii <esc>
map ; :
