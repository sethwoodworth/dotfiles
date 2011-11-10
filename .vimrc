" " @Sethish: Seth Woodworth's vimrc config.

" Generic 'turning-on' of vim
syn on

" Pathogen Plugin manager's configs
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Vim Features
set history=1000 "minimum sane history recording
set paste " srsly, don't indent what I copypasta
set hidden " enable hidden buffers
set nocompatible "Unset because no one needs vi compatiblity
set backspace=indent,eol,start " erase autoindents, join lines, and make backspace work past insert location
set wildmenu                " colon tab-completion = on
set wildmode=list:longest   " colon tab-completion options

" " Search behavior
" " Python style search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase "Cumulatively makes it so Vim handles case of searching intelligently
set incsearch
set showmatch
set gdefault " s/foo/bar/ defaults to s/foo/bar/g

" " OmniComplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let g:SuperTabDefaultCompletionType = "context"


" Visual setup
set wrap
set textwidth=80
set formatoptions=qn2 "format comments gq, reconize numbered lists , Don't break a line after a one-letter word
set title "rewrite the teriminal title
set number "ruler
set visualbell " Use screen flash instead of system terminal bell (I use this in bash anyway)
set cursorline " underline the line the cursor is on
set ttyfast " faster tty screen refresh (Maybe not for remote machines?)
set ruler " report the location of the cursor via x,y in the bottom right
set showmatch " When typing a closing bracket, flash the cursor to the matching opening bracket
" " Functional/visual
set encoding=utf-8 "allow more characters, honestly better in the long run
set scrolloff=2 "keep context lines between the cursor and the edge of the window
" " Tab settings
set tabstop=4
set autoindent " smart auto indenting
set softtabstop=4
" Settings for softtabs
"set smarttab
"set expandtab
" Settings for hardtabs
set shiftwidth=4
" " Color settings
set t_Co=256 " use full color
let g:zenburn_high_Contrast=1
colorscheme zenburn
" " Colorscheme overrides
hi ColorColumn ctermbg=238
" " Gvim settings
set guioptions+=LlRrb
set guioptions-=LlRrb
set list listchars=tab:·\ ,trail:•


" Keybindings
imap ii <esc> " ii escapes insertmode
" " Unmap some keys that get in the way
inoremap <F1> <ESC> "who uses the F1 help, srsly?
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" " Toggles
nnoremap <F2> :set nonumber!<CR>
nnoremap <F3> :call ToggleColumnColor()<CR>
nnoremap <F4> :call ToggleConceal()<CR>
" " Leader key behavior and mappings
let mapleader = " "
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> "open vimrc for editing
nnoremap <leader>h :setfiletype htmldjango<cr>
nnoremap <leader>w <C-w>v<C-w>l "open v-split and switch to it
" " Spell Check
nnoremap <leader>s :setlocal spell!<cr>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=


" Autogroups
au FocusLost * :wa " tabing away from Vim = save file
augroup markdown
    au! BufRead,BufNewFile *.mkd   setfiletype markdown
augroup END

augroup htmldjango
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
augroup END


" Functions
function! ToggleColumnColor()
  if &colorcolumn != '0'
    set colorcolumn=0
    echo "ColorColumn highlighting off"
  else
    set colorcolumn=80
    echo "ColorColumn highlighting on"
  endif
endfunction

function! ToggleConceal()
  if &conceallevel != '0'
    set conceallevel=0
    set nonumber
    echo "ConcealLevel off"
  else
    set conceallevel=2
    set number
    echo "ConcealLevel on"
  endif
endfunction
