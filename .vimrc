syntax on " enable syntax highlighting
filetype plugin indent on " follow language specific indentation rules

" Reminder:
" :h <command>
set autoread
set clipboard=unnamedplus
set colorcolumn=80
set cursorline
set cursorcolumn
set encoding=utf8
set hidden
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set list " this along with next line shows whitespace
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣ " shows all whitespace
set listchars=eol:¬,tab:▸·,trail:#,extends:❯,precedes:❮,space:·,nbsp:␣ " shows all whitespace
set mouse=a " allows mouse on vim >:(
set nobackup
set nocompatible
set noswapfile
set nowb
set number
set relativenumber
set ruler
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set autoindent
set splitbelow
set splitright
set tabstop=4
set inccommand=split


" NO ARROW KEYS ANYWHERE!!! >:)
" in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>
"
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" closes a window
noremap <leader>x :q<Cr>

" makes Y copy from cursor to EOL
nnoremap Y "+y
vnoremap Y "+y
nnoremap yY ^"+y$

" makes n N and J center on screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap J mzJ`z
nnoremap <C-j> :cnext<CR>zzzv
" makes the following symbols breakpoints in undo chain
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

:cabbrev h vert h

" adds k and j to jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

nnoremap / /\v
cnoremap %s/ %s/\v

" allows enter and shift enter to insert lines in normal mode
nmap <CR> o<Esc>k

" cleverf plugin settings
" nmap <Esc> <Plug>(clever-f-reset)
" map ; <Plug>(clever-f-repeat-forward)
" map , <Plug>(clever-f-repeat-back)

