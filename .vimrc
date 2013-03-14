" " @Sethish: Seth Woodworth's vimrc config.

" setup vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Generic 'turning-on' of vim
syn on

" Vim Features
set history=1000 "minimum sane history recording
set tabpagemax=50 "allow opening of multiple files via `vim -p file file file`
"set paste " srsly, don't indent what I copypasta
"set hidden " enable hidden buffers
set nocompatible "Unset because no one needs vi compatiblity
set backspace=indent,eol,start " erase autoindents, join lines, and make backspace work past insert location
set wildmenu                " colon tab-completion = on
set wildmode=list:longest   " colon tab-completion options
set laststatus=2 "Always have filenames, but eats a screenline
set undofile " Hell, lets start saving edit history
set showbreak=↪ " start of lines that have been wrapped
set showcmd " show (partial) command in status line
set showmatch " flash to the matching paren
set matchtime=2 " for this amount of time (default 5)
set title " let vim set the title of the terminal

set dictionary=/usr/share/dict/words "i ctrl_x ctrl_k completion
"
"
" " Backups
set undodir=~/.vim/tmp/undo//       " undo files
set backupdir=~/.vim/tmp/backup//   " backups
set backup                          " enable backups
"
"
" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.
set statusline+=\    " Space.

set statusline+=%{tagbar#currenttag('[%s]','','f')}
set statusline+=%*   " Reset highlighting.

set statusline+=%#warningmsg#   " Syntastic warnings
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*   " Reset highlighting.
set statusline+=%=   " Right align.
" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff} " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft} " Type (python).
set statusline+=)
" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

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
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal sw=2 ts=2 sts=2
autocmd FileType htmldjango setlocal sw=2 ts=2 sts=2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal sw=2 ts=2 sts=2

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
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent " smart auto indenting
" " Color settings
"set t_Co=16 " use terminal colors
set t_Co=256 " use full color
" " Colorscheme overrides
set background=dark


Bundle 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility='low'
let g:solarized_contrast='normal'
colorscheme solarized
"hi ColorColumn ctermbg=238
" " Gvim settings
"let g:zenburn_high_Contrast=1
set guioptions+=LlRrb
set guioptions-=LlRrb
" " Pretty unicode
"set list listchars=tab:·\ ,trail:↜,nbsp:•
"set list listchars=tab:·\ ,trail:խ,nbsp:•
set list listchars=tab:·\ ,trail:ᚗ,nbsp:•
set fillchars=vert:│
set cpo+=J " if using two-spaces after periods, this lets me yank full sentences correctly.


Bundle 'scrooloose/syntastic'
" Syntastic error checker settings
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1 " set this to 0 to get rid of error buffers
"let g:syntastic_enable_signs=0 "no left of linenum signs
let g:syntastic_error_symbol='☠'
let g:syntastic_warning_symbol='‽'
let g:syntastic_auto_jump=0 " Do not jump to first error on save/open
let g:syntastic_stl_format = '[%E{⦻: #%e l%fe}%B{, }%W{⚠: #%w %fw}]'
"let g:syntastic_stl_format='Syntax: line:%F (%t)'
let g:syntastic_python_checker='pylint'
let g:syntastic_python_checker_args='-d C0301,E1101'
"let g:syntastic_python_checker_args='--max-complexity=10 --ignore=E501,E221,E126'
" E501 line too long
" E221 too much space before = (aligning ='s)
" E126 too many tabs after a continuation `\`

" " Tagbar conf
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/AutoTag'
let g:tagbar_compact = 1    " compact vertically
let g:tagbar_width = 30     " take less horizontal space default 40
let g:tagbar_autofocus = 1  " when opening, switch focus to tagbar

" " Showmarks bundle config
Bundle 'sethwoodworth/vim-showmarks'
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_textlower="§\t" " needs to have a doublewidth character
let g:showmarks_prefix="§" " if I use a doublewidth unicode char, do so here
"" clear the signs column of the gray highlight
highlight clear SignColumn


" Keybindings
map Y y$ " Y yanks to end of line
imap ii <esc> " ii escapes insertmode
" " Unmap some keys that get in the way
inoremap <F1> <ESC> "who uses the F1 help, srsly?
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" " Toggles
nnoremap <F2> :set nonumber!<CR>
nnoremap <F3> :call ToggleColumnColor()<CR>
nnoremap <F4> :call ToggleConceal()<CR>
nnoremap <F5> :set list!<CR>
" tab tab switches between vim panes
map <Tab><Tab> <C-W>w
" " Leader key behavior and mappings
let mapleader = " "
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> "open vimrc for editing
nnoremap <leader>h :setfiletype htmldjango<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>2 :call TStwo()<CR>
nnoremap <leader>4 :call TSfour()<CR>
" toggle set paste, this disables auto-tabing
nnoremap <leader>p :set paste!<CR>
" Syntastic error box
nnoremap <leader>e :lw<CR>
nnoremap <leader>s :let g:syntastic_enable_signs=1<CR>
nnoremap <leader>S :let g:syntastic_enable_signs=0<CR>
nnoremap <leader>E :lcl<CR>
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>T :TagbarOpenAutoClose<CR>
map <C-\> :vsp <CR><C-w><C-w>:exec("tag ".expand("<cword>"))<CR>
" " Spell Check
"nnoremap <leader>s :setlocal spell!<cr>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=
" Easier to type, and I never use the default behavior.
"       move to far left
noremap H ^
"       move to far right
noremap L g_
" Less chording
nnoremap ; :
" Switch windows with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Autogroups
au FocusLost * :wa " tabing away from Vim = save file

Bundle 'tpope/vim-markdown'
augroup ft_markdown
    au!

    " Very possibly over reaching
    au BufNewFile,BufRead *.m*d setlocal filetype=markdown

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

augroup html
    autocmd!
    autocmd Filetype html set tabstop=2
    autocmd Filetype html set softtabstop=2
    autocmd Filetype html set shiftwidth=2
augroup END

augroup htmldjango
    autocmd!
    autocmd Filetype html set tabstop=2
    autocmd Filetype html set softtabstop=2
    autocmd Filetype html set shiftwidth=2
augroup END

" Functions
function! TStwo()
    setlocal tabstop=2 softtabstop=2 shiftwidth=2
endfunction

function! TSfour()
    setlocal tabstop=4 softtabstop=4 shiftwidth=4
endfunction

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

Bundle 'klen/rope-vim'
" Rope
"let PYTHONPATH
"source /home/seth/.vim/bundle/ropevim/ropevim.vim
let g:pymode_rope_auto_project = 1
let g:pymode_rope_autoimport_generate = 1

Bundle 'davidhalter/jedi-vim'
