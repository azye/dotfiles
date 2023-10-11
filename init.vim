" Vim Plug plugins
call plug#begin()
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'folke/lsp-colors.nvim'
" Plug 'folke/trouble.nvim'
" Plug 'ggandor/lightspeed.nvim'
" Plug 'godlygeek/tabular'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'j-hui/fidget.nvim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'leafgarland/typescript-vim'
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'mbbill/undotree'
" Plug 'mhinz/vim-startify'
Plug 'justinmk/vim-sneak'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'neovim/nvim-lspconfig'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'numToStr/Comment.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'pangloss/vim-javascript'
" Plug 'preservim/vim-markdown'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'rhysd/clever-f.vim'
" Plug 'sbdchd/neoformat'
" Plug 'sheerun/vim-polyglot'
" Plug 'scrooloose/syntastic'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
" Plug 'vim-airline/vim-airline'
" Plug 'wbthomason/packer.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox

lua << END
require('Comment').setup()
END
" require('gitsigns').setup()
" require('lualine').setup()
"
so ~/.vimrc
