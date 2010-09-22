syn on

"Pathogen Plugin manager's configs
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible "Unset because no one needs vi compatiblity

" Auto-settings
au FocusLost * :wa " tabing away from Vim = save file
set hidden
set history=1000


" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent " smart auto indenting!


" Other recommended options
set encoding=utf-8 "allow more characters, honestly better in the long run
set scrolloff=2 "keep context lines between the cursor and the edge of the window

" Smarter tab-completion above the statusbar
set wildmenu
set wildmode=list:longest

" Visual modifications
set visualbell " Use screen flash instead of system terminal bell (I use this in bash anyway)
set cursorline " underline the line the cursor is on
set ttyfast " faster tty screen refresh (Maybe not for remote machines?)
set ruler " report the location of the cursor via x,y in the bottom right
set showmatch " When typing a closing bracket, flash the cursor to the matching opening bracket


" Key behavior
set backspace=indent,eol,start " erase autoindents, join lines, and make backspace work past insert location


" Search
nnoremap / /\v " Use Python compatible regex in search by default
vnoremap / /\v
set ignorecase
set smartcase "Cumulatively makes it so Vim handles case of searching intelligently
set incsearch
set showmatch
set gdefault " Make find and replace apply multiple times to each line (use /g to unset)


" Text wraping and handling
set wrap
set textwidth=79
"set colorcolumn=85 " Sounds cool, but vim y7.3 only
set formatoptions=qn2 "format comments gq, reconize numbered lists , Don't break a line after a one-letter word


" Rebind keys
nnoremap <tab> % " use <tab> to move the cursor between matching brackets
vnoremap <tab> %
imap ii <esc> " ii escapes insertmode


" Unmap 'useless' keys
inoremap <F1> <ESC> "who uses the F1 help, srsly?
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Leader key behavior and settings
let mapleader = "<space>"
" Leader key maps
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " <space>+W kills extra whitespace
nnoremap <leader>a :Ack " Use Ack!
nnoremap <leader>v V`] " reselect text I just pasted
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> " edit vimrc in a virtical split
nnoremap <leader>w <C-w>v<C-w>l " open new v split and switch to it




