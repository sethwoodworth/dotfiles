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

call neobundle#begin(expand('~/.vim/bundle/'))             " NeoBundle, required
NeoBundleFetch 'Shougo/neobundle.vim'                   " NeoBundle, required
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'sjl/badwolf'
"NeoBundle 'altercation/vim-colors-solarized'
NeoBundleLazy 'scrooloose/syntastic', {'autoload' : {'filetypes' : ['ruby', 'javascript'] } }
NeoBundleLazy 'nathanaelkane/vim-indent-guides', {'autoload' : {'filetypes' : ['html'] } }
"NeoBundleLazy 'MarcWeber/vim-addon-mw-utils', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
"NeoBundleLazy 'tomtom/tlib_vim', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
"NeoBundleLazy 'honza/vim-snippets', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
"NeoBundleLazy 'garbas/vim-snipmate', {'autoload' : {'filetypes' : ['python', 'css', 'html'] } }
"NeoBundle 'bling/vim-airline'
NeoBundleLazy 'majutsushi/tagbar',      {'autoload' : {'filetypes' : ['python', 'ruby', 'javascript', 'css'] } }
NeoBundleLazy 'vim-scripts/AutoTag',    {'autoload' : {'filetypes' : ['python', 'ruby', 'javascript', 'css'] } }
NeoBundleLazy 'ehamberg/vim-cute-python', {'autoload' : {'filetypes' : ['python'] } }
NeoBundleLazy 'klen/python-mode', {'autoload' : {'filetypes' : ['python'] } }
" Handle new html5 tags and properties
NeoBundleLazy 'othree/html5.vim.git', {'autoload' : {'filetypes' : ['html'] } }
" Add CSS3 syntax highlighting
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload' : {'filetypes' : ['css'] } }
" Highlight scss
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload' : {'filetypes' : ['scss'] } }
"NeoBundleLazy 'mikewest/vimroom', {'autoload' : {'filetypes' : ['markdown'] } }
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'mtth/cursorcross.vim'
call neobundle#end()
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
set showcmd                                             " show command in status line

set lazyredraw                                          " redraw a/ macros or registers
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Tab behaviors
set tabstop=4                                           " 4 space tabs
set softtabstop=4
set shiftwidth=4
set expandtab                                           " turn tabs to spaces
set smarttab                                            " remember indent
set autoindent                                          " smart auto indenting


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Split behaviors
set splitbelow                                          " new hoz splits go below
set splitright                                          " new vert splits go right

                                                " Switch panes with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Style

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'        " Highlight merge conflicts
set list listchars=tab:·\ ,trail:≁,nbsp:∝               " Highlight special characters
set showbreak=↪                                         " Mark lines that have been wrapped
" cpotions: aABceFs -- defaults
set cpo+=J                                              " Yank by sentence (2-space a/ period)

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
inoremap <F1> <ESC>
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
nnoremap <leader>w <C-w>v
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
" ~> Syntastic error highlighting
                                        " Show syntastic error box
nnoremap <leader>e :lw<CR>
                                        " Hide syntastic error box
nnoremap <leader>E :lcl<CR>
let g:syntastic_check_on_open=1         " Don't check for errors until save
"let g:syntastic_enable_signs=0         "no left of linenum signs
let g:syntastic_error_symbol=' ⧰'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=0 " Do not jump to first error on save/open
let g:syntastic_stl_format = '[%E{⧰: #%e l%fe}%B{, }%W{⚠: #%w %fw}]'
let g:syntastic_python_checker_args='-d C0301,E1101'
                            " E501 line too long
                            " E221 too much space before = (aligning ='s)
                            " E126 too many tabs after a continuation `\`


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Indentation gutters for HTML
let g:indent_guides_start_level = 2                     " Show vert gutters in html files


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Snipmate
            " snippit expand is set to
            " .<tab>   " expands to selector, then tabs into the {}s
            " d:n<tab>      display:none
            " list:n<tab> d:i<tab> list-style: none, display:inline
            " tt:u<tab> text-transform: uppercase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Airline
let g:airline#extensions#tabline#enabled = 1
" when only one tab is open, show all of the open buffers
" user powerline patched fonts = no
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#left_alt_sep = '|'
" dict of configurably unicode symbols. mmmmmmmmmm
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Tagbar tag browser
                                        " open tagbar, switch to it
nnoremap <leader>t :TagbarToggle<CR>
                                        " open tagbar, close when done
nnoremap <leader>T :TagbarOpenAutoClose<CR>

if (exists(":TagbarToggle"))
    " if tagbar is loaded
    " enable tagbar etension for airline
    let g:airline#extensions#tabline#enabled = 1
en

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Ruby style settings
au FileType ruby setl sw=2 ts=2 sts=2 et sta autoindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Python

" Configuration for Python-mode
let g:pymode_quickfix_minheight = 5
let g:pymode_quickfix_maxheight = 12
let g:pymode_folding = 0
let g:pymode_breakpoint_bind = '<leader>b'
"let g:pymode_breakpoint_cmd = '' " blank for auto detect?
nnoremap <leader>l :PymodeLint<cr>
let g:pymode_lint_ignore = "E501,E221"
" error signs
let g:pymode_lint_todo_symbol = '⚔'
"let g:pymode_lint_error_symbol = '⚠'
let g:pymode_lint_error_symbol = '‼‼'
let g:pymode_lint_comment_symbol = '♲'
let g:pymode_rope_show_doc_bind = '<leader>d'
let g:pymode_rope_goto_definition_bind = '<leader>g'
"let g:pymode_rope_organize_imports_bind = '<C-c>ro' "default

" Movement
" [[,]] prev|next class/func
" [M,]M prv|next class/method
" aC Select a class. Ex: vaC, daC, yaC, caC
" iC Select inner class. Ex: viC, diC, yiC, ciC
" aM Select a function or method. Ex: vaM, daM, yaM, caM
" iM Select inner function or method. Ex: viM, diM, yiM, ciM

" TODO let g:pymode_virtualenv_path = $VIRTUAL_ENV



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Syntax bundles
" leader V toggles

" ~> Nerd commenter

" ~> Crosshairs for the vim cursor
let g:cursorcross_dynamic = 'lw'
set cursorcolumn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Documentation of the day
"  > Try to learn a new vim tool
nnoremap <leader>h <C-w>v:e ~/.vim/bundle/vim-snippets/snippets/python.snippets<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ~> Configuration complete
