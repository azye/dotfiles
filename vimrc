colorscheme slate
syntax on
set number
filetype plugin indent on
set autoread
set ruler
set hid
set ignorecase
set mouse=a
set smartcase
set lazyredraw 
set encoding=utf8
set nobackup
set nowb
set noswapfile
set colorcolumn=80
set number relativenumber
set nu rnu
set ai 
set si
set wrap
set hlsearch 
set ignorecase
set incsearch
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" makes Y copy from cursor to EOL
nnoremap Y y$
" makes n N and J center on screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-j> :cnext<CR>zzzv
" makes the following symbols breakpoints in undo chain
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" nerdtree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-g> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()
