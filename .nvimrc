" A neovim configuration using vim-plugged
call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-sensible'   " being merged into nvim default soon
Plug 'sjl/badwolf'          " colorscheme
Plug 'nathanaelkane/vim-indent-guides', {'for': ['html', 'htmldjango']}
Plug 'blueyed/vim-tmux-navigator'

Plug 'vim-scripts/AutoTag', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar' ", {'on': 'TagbarToggle'}

Plug 'bling/vim-airline'

Plug 'scrooloose/syntastic', {'for' : ['sh', 'bash']}

Plug 'MarcWeber/vim-addon-mw-utils'  ", {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'tomtom/tlib_vim', {'for' : ['python', 'ruby', 'html', 'css']}
Plug 'scrooloose/nerdtree' ", {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
"
Plug 'honza/vim-snippets'  ", {'for' : ['python', 'ruby', 'html', 'htmldjango', 'css']}
Plug 'SirVer/ultisnips'
"Plug 'garbas/vim-snipmate'  ", {'for' : ['python', 'ruby', 'html', 'css']}

Plug 'klen/python-mode', {'for' : 'python'}
Plug 'janko-m/vim-test'
Plug 'jmcantrell/vim-virtualenv'
Plug 'kassio/neoterm'

Plug 'mileszs/ack.vim'

Plug 'dahu/vimple', {'for' : 'asciidoc'}
Plug 'dahu/Asif', {'for' : 'asciidoc'}
Plug 'vim-scripts/SyntaxRange', {'for' : 'asciidoc'}
Plug 'dahu/vim-asciidoc', {'for' : 'asciidoc'}
Plug 'vim-voom/VOoM', {'for' : ['markdown', 'asciidoc']}

Plug 'jamessan/vim-gnupg'
Plug 'chriskempson/base16-vim'

Plug 'kchmck/vim-coffee-script'

Plug 'godlygeek/tabular'

Plug 'fatih/vim-go', {'for' : ['go']}

call plug#end()

" Unicode by default
scriptencoding utf-8

" Colorscheme
set t_Co=256
let base16colorspace=256
colorscheme base16-default

set background=dark

" Visual behaviors
set lazyredraw
set visualbell
set list listchars=tab:·\ ,trail:≁,nbsp:∝
set wildmode=list:longest
set showmatch matchtime=2
set ttimeoutlen=10

" mice are a pernicious habit, (but not literally)
set mouse=


" Search behavior
set smartcase
nnoremap / /\v
vnoremap / /\v

" Split behavior
set splitbelow
set splitright

" Normal mode bindings
nnoremap H ^
nnoremap L g_
nnoremap Y y$
nnoremap <F1> <ESC>
" Switch panes with ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Allow switching from vim terminals
tnoremap <C-h> <C-\><C-n>h
tnoremap <C-j> <C-\><C-n>j
tnoremap <C-k> <C-\><C-n>k
tnoremap <C-l> <C-\><C-n>l

" nvim terminal
tnoremap <Esc> <C-\><C-n>

" set g:terminal_scrollback_buffer_size=10000

" numberwang
set number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber

" if you move to another pane or window, save!
autocmd FocusLost * silent! wa


" Leader settings
let mapleader = " " " <space> as leader
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
nnoremap <leader>v `[v`]

nnoremap <leader>s <C-w>v :e ~/.nvim/plugged/vim-snippets/snippets/python.snippets<CR>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>a :Ack 

" Tab settings
set expandtab shiftwidth=2 softtabstop=2
autocmd Filetype python setlocal shiftwidth=4 softtabstop=4

" Python-mode settings
let g:python_host_prog='/usr/bin/python2'
let g:pymode_folding = 0
" vaC, vaM -- select class, method
" <leader>b insert breakpoint
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX: breakpoint'
let g:pymode_complete_on_dot = 0
let g:pymode_lint_ignore = "E501,E221,E302,E701"
let g:pymode_virtualenv = 0
" completion via C-Space
" <C-c>g for jump to definition

let NERDTreeIgnore=['\.pyc']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0

let vimple_init_vn = 0
let g:ackprg = 'ag --vimgrep'

" vim-test bindings
nmap <silent> <leader>n :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = 'neoterm'
let test#python#runner = 'nose'
" let test#python#nose#executable = './venv/bin/nosetests'
