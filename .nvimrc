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

call plug#end()

colorscheme badwolf

" Visual behaviors
set number
set lazyredraw
set visualbell
set showmatch
set matchtime=2
set wildmode=list:longest
set smartcase

set splitbelow
set splitright

" Switch panes with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Y yanks from cursor to $
map Y y$
" move to far left
noremap H ^
" move to far right
noremap L g_
" don't open help or w/e when hitting F1
noremap <F1> <ESC>

let mapleader = " "
" reselect last selection
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v>:e $MYVIMRC<CR>
nnoremap <leader>w <C-w>v
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>e :lwindow<CR>
nnoremap <leader>E :lclose<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>T :TagbarOpenAutoClose<CR>

" language settings
set expandtab
autocmd Filetype python setlocal shiftwidth=4 softtabstop=4
autocmd Filetype html setlocal shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2
