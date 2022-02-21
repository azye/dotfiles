call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'morhetz/gruvbox'
call plug#end()

" colorscheme slate
syntax on
set number
set number relativenumber
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
set nu rnu
set ai 
set si
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

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

autocmd vimenter * ++nested colorscheme gruvbox
