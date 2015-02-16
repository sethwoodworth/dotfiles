" A neovim configuration using vim-plugged
call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-sensible'   " smart defaults
Plug 'sjl/badwolf'          " colorscheme
Plug 'nathanaelkane/vim-indent-guides', {'for': ['html', 'htmldjango']}
Plug 'blueyed/vim-tmux-navigator'
Plug 'vim-scripts/AutoTag', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar' ", {'on': 'TagbarToggle'}
Plug 'bling/vim-airline'

Plug 'MarcWeber/vim-addon-mw-utils', {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'tomtom/tlib_vim', {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'honza/vim-snippets', {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'garbas/vim-snipmate', {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'klen/python-mode', {'for' : 'python'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'

Plug 'mileszs/ack.vim'

Plug 'dahu/vimple', {'for' : 'asciidoc'}
Plug 'dahu/Asif', {'for' : 'asciidoc'}
Plug 'vim-scripts/SyntaxRange', {'for' : 'asciidoc'}
Plug 'dahu/vim-asciidoc', {'for' : 'asciidoc'}

call plug#end()

" Unicode by default
set encoding=utf-8
scriptencoding utf-8

" Colorscheme
colorscheme badwolf
set background=dark

" Visual behaviors
" Fixes
set lazyredraw
set visualbell

" Visual configuration
set number
set list listchars=tab:·\ ,trail:≁,nbsp:∝
set wildmode=list:longest
set showmatch matchtime=2

" Search behavior
set smartcase
nnoremap / /\v
vnoremap / /\v

" split behavior
set splitbelow
set splitright

" Switch panes with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Yank, all left, all right
map Y y$
map H ^
map L g_
noremap <F1> <ESC>

let mapleader = " "
nnoremap <leader>e :lwindow<CR>
nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>
nnoremap <leader>E :lclose<CR>
nnoremap <leader>F :PymodeLintToggle<CR>:PymodeLintAuto<CR>:PymodeLint<CR>
nnoremap <leader>l :PymodeLint<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>T :TagbarOpenAutoClose<CR>
nnoremap <leader>w <C-w>v
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>sp <C-w>v :e ~/.nvim/plugged/vim-snippets/snippets/python.snippets<CR>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>a :Ack

" Tab settings
set expandtab shiftwidth=2 softtabstop=2
autocmd Filetype python setlocal shiftwidth=4 softtabstop=4
autocmd Filetype html setlocal shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2

" Python-mode settings
let g:pymode_folding = 0
" vaC, vaM -- select class, method
" <leader>b insert breakpoint
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX: breakpoint'
let g:pymode_lint_ignore = "E501,E221"
let g:pymode_virtualenv = 0

let NERDTreeIgnore=['\.pyc']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0


let vimple_init_vn = 0
let g:ackprg = 'ag --vimgrep'
