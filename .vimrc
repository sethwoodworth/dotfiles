""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"    Seth Wolfwood's Dotfiles: .vimrc                                          "
"    - uses NeoBundle to manage and load plugins                               "
"    - optimized for python readability (IMO, YMMV)                            "
"                                                                              "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Pre-setup

if has('vim_starting')
    set nocompatible                                    " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/       " NeoBundle, required
endif

call neobundle#rc(expand('~/.vim/bundle/'))             " NeoBundle, required
NeoBundleFetch 'Shougo/neobundle.vim'                   " NeoBundle, required

filetype plugin indent on                               " NeoBundle, required
NeoBundleCheck                                          " NeoBundle, required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> General
syntax on                                               " Use syntax highlighting
set history=1000                                        " minimum history recording
set title                                               " vim sets terminal title
set tabpagemax=50                                       " `vim -p file file file` ...
set encoding=utf-8                                      " Unicode by default
set dictionary=/usr/share/dict/words                    " i ctrl_x ctrl_k completion

set undofile                                            " save central undo files
set undodir=~/.vim/tmp/undo/
set backup                                              " enable backups
set backupdir=~/.vim/tmp/backup/

"set laststatus=2                                       " Always have filenames

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Visual Behaviors
set number                                              " Line # by default
"FIXME: ruler doesn't work with airline
"set ruler                                               " put cursor coords in status
set showcmd                                             " show command in status line
set splitbelow                                          " new hoz splits go below
set splitright                                          " new vert splits go right
set visualbell                                          " Flash screen not bell
set showmatch                                           " flash to the matching paren
set matchtime=2                                         " for 2 seconds (default 5)
set wrap                                                " Wrap long lines
set textwidth=80                                        " consider PEP8 by default
set scrolloff=2                                         " keep 2 lines between cursor and edge
set formatoptions=qn2                                   " Format comments gq
                                                        "   reconize numbered lists
                                                        "   No break lines after 1 letter word

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Behaviors

set gdefault                                            " s/foo/bar/ => s/foo/bar/g

set backspace=indent,eol,start                          " erase autoindents, join lines
set wildmenu                                            " vim internal tab-completion
set wildmode=list:longest

                                                        " Search behavior
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase                                           " insensitive until you are
set incsearch
set showmatch                                           " highlight search matches


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Tab settings
set tabstop=4                                           " 4 space tabs
set softtabstop=4
set shiftwidth=4
set expandtab                                           " turn tabs to spaces
set smarttab                                            " remember indent
set autoindent                                          " smart auto indenting


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Style

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'        " Highlight merge conflicts
set list listchars=tab:·\ ,trail:≁,nbsp:∝               " Highlight special characters
set showbreak=↪                                         " Mark lines that have been wrapped
set cpo+=J                                              " Yank by sentence (2-space a/ period)

NeoBundle 'sjl/badwolf'
colorscheme badwolf

set fillchars=vert:│

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Keybindings
map Y y$                                                " Y yanks from cursor to $
                                                        " move to far left
noremap H ^
                                                        " move to far right
noremap L g_

" blackhole
inoremap <F1> <ESC> "who uses the F1 help, srsly?
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Leader key bindings
let mapleader = " "                                     " <space> as leader ++
                                        " Strip whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
                                        " select last selected or pasted thing
nnoremap <leader>v V`]
                                        " edit vimrc in vert split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> "open vimrc for editing
                                        " set filetype to htmldjango
nnoremap <leader>h :setfiletype htmldjango<cr>
                                        " use 2-tab spaces
nnoremap <leader>2 :call TStwo()<CR>
                                        " use 4-tab spaces
nnoremap <leader>4 :call TSfour()<CR>
                                        " toggle set paste
nnoremap <leader>p :set paste!<CR>
                                        " new hoz split
nnoremap <leader>w <C-w>v<C-w>l
                                        " new vert split
nnoremap <leader>- <C-w>s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Functions
function! TStwo()
    setlocal tabstop=2 softtabstop=2 shiftwidth=2
endfunction

function! TSfour()
    setlocal tabstop=4 softtabstop=4 shiftwidth=4
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Tmux & vim movements
NeoBundle 'christoomey/vim-tmux-navigator'
                                                " Switch panes with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Nerd commenter
NeoBundle 'scrooloose/nerdcommenter'
"FIXME: does the following line do Ctrl-c or <leader>c ?
"imap <C-c> <plug>NERDCommenterInsert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Syntastic error highlighting
NeoBundleLazy 'scrooloose/syntastic', {'autoload' : {'filetypes' : ['python', 'javascript'] } }
                                        " Show syntastic error box
nnoremap <leader>e :lw<CR>
                                        " Hide syntastic error box
nnoremap <leader>E :lcl<CR>
let g:syntastic_check_on_open=1         " Don't check for errors until save
"let g:syntastic_enable_signs=0         "no left of linenum signs
let g:syntastic_error_symbol='⧰'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=0 " Do not jump to first error on save/open
let g:syntastic_stl_format = '[%E{⧰: #%e l%fe}%B{, }%W{⚠: #%w %fw}]'
let g:syntastic_python_checker_args='-d C0301,E1101'
                            " E501 line too long
                            " E221 too much space before = (aligning ='s)
                            " E126 too many tabs after a continuation `\`


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Indentation gutters for HTML
NeoBundleLazy 'nathanaelkane/vim-indent-guides', {'autoload' : {'filetypes' : ['html'] } }
let g:indent_guides_start_level = 2                     " Show vert gutters in html files


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Snipmate
NeoBundleLazy 'MarcWeber/vim-addon-mw-utils', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
NeoBundleLazy 'tomtom/tlib_vim', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
NeoBundleLazy 'honza/vim-snippets', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
NeoBundleLazy 'garbas/vim-snipmate', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
            " snippit expand is set to
            " .<tab>   " expands to selector, then tabs into the {}s
            " d:n<tab>      display:none
            " list:n<tab> d:i<tab> list-style: none, display:inline
            " tt:u<tab> text-transform: uppercase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Airline
NeoBundle 'bling/vim-airline'
" when only one tab is open, show all of the open buffers
"let g:airline#extensions#tabline#enabled = 1
" user powerline patched fonts
let g:airline_powerline_fonts = 1
" dict of configurably unicode symbols. mmmmmmmmmm
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Tagbar tag browser
NeoBundleLazy 'majutsushi/tagbar',      {'autoload' : {'filetypes' : ['python', 'javascript', 'css'] } }
NeoBundleLazy 'vim-scripts/AutoTag',    {'autoload' : {'filetypes' : ['python', 'javascript', 'css'] } }
                                        " open tagbar, switch to it
nnoremap <leader>t :TagbarToggle<CR>
                                        " open tagbar, close when done
nnoremap <leader>T :TagbarOpenAutoClose<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Syntax bundles
" Handle new html5 tags and properties
NeoBundleLazy 'othree/html5.vim.git', {'autoload' : {'filetypes' : ['html'] } }
" Add CSS3 syntax highlighting
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload' : {'filetypes' : ['css'] } }
" Highlight scss
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload' : {'filetypes' : ['scss'] } }
NeoBundleLazy 'mikewest/vimroom', {'autoload' : {'filetypes' : ['markdown'] } }
" leader V toggles
