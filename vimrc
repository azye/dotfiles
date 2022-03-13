
" Vim Plug plugins
call plug#begin()
Plug 'HerringtonDarkholme/yats.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'godlygeek/tabular'
Plug 'j-hui/fidget.nvim'
Plug 'jiangmiao/auto-pairs'
" Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'neovim/nvim-lspconfig'
Plug 'ntpeters/vim-better-whitespace'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pangloss/vim-javascript'
Plug 'preservim/vim-markdown'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rhysd/clever-f.vim'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'wbthomason/packer.nvim'
call plug#end()

syntax on " enable syntax highlighting
filetype plugin indent on " follow language specific indentation rules

" Reminder:
" :h <command>
set autoread
set clipboard=unnamedplus
set colorcolumn=80
set cursorline
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
" in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" in Visual Mode
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
nnoremap Y y$
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

" adds k and j to jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" allows enter and shift enter to insert lines in normal mode
nmap <CR> o<Esc>k

" File type remappings
autocmd BufEnter *.yaml.tmpl :setlocal filetype=yaml

" cleverf plugin settings
nmap <Esc> <Plug>(clever-f-reset)
" map ; <Plug>(clever-f-repeat-forward)
" map , <Plug>(clever-f-repeat-back)

if has('nvim')
nnoremap <C-p> <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <C-F> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

autocmd vimenter * ++nested colorscheme gruvbox

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_autowrite = 1

let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
	\ 'git': 1,
	\ 'folders': 1,
	\ 'files': 1,
	\ 'folder_arrows': 1,
	\ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
	\ 'default': '',
	\ 'symlink': '',
	\ 'git': {
	\   'unstaged': "✗",
	\   'staged': "✓",
	\   'unmerged': "",
	\   'renamed': "➜",
	\   'untracked': "★",
	\   'deleted': "",
	\   'ignored': "◌"
	\   },
	\ 'folder': {
	\   'arrow_open': "",
	\   'arrow_closed': "",
	\   'default': "",
	\   'open': "",
	\   'empty': "",
	\   'empty_open': "",
	\   'symlink': "",
	\   'symlink_open': "",
	\   }
	\ }

highlight NvimTreeFolderIcon guibg=blue
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors " this variable must be enabled for colors to be applied properly

nnoremap <leader>ux <cmd>TroubleToggle<cr>
nnoremap <leader>uw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>ud <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>uq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>ul <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

lua << EOF
require("fidget").setup{}
require('gitsigns').setup()
require('Comment').setup()
require("trouble").setup {}

local lsp = require "lspconfig"
local coq = require "coq"
local util = require "lspconfig/util"


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

lsp.vimls.setup(coq.lsp_ensure_capabilities{
	on_attach = on_attach
})


lsp.pyright.setup(coq.lsp_ensure_capabilities{
	on_attach = on_attach
})
lsp.quick_lint_js.setup(coq.lsp_ensure_capabilities{
	on_attach = on_attach
})
lsp.tsserver.setup(
	coq.lsp_ensure_capabilities{
		cmd = { "typescript-language-server", "--stdio" },
		on_attach = on_attach
	}
)

lsp.gopls.setup(
	coq.lsp_ensure_capabilities{
		cmd = {"gopls", "serve"},
		filetypes = {"go", "gomod"},
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		on_attach = on_attach,
		settings = {
		  gopls = {
			analyses = {
			  unusedparams = true,
			},
			staticcheck = true,
		  },
		},
	}
) 

require'nvim-tree'.setup {
  view = {
	width = 30,
	height = 30,
	hide_root_folder = false,
	side = 'left',
	preserve_window_proportions = false,
	mappings = {
	  custom_only = false,
	  list = {}
	},
	number = true,
	relativenumber = true,
	signcolumn = "yes"
  },
  trash = {
	cmd = "trash",
	require_confirm = true
  },
  actions = {
	change_dir = {
	  enable = true,
	  global = false,
	},
	open_file = {
	  quit_on_open = true,
	  resize_window = false,
	  window_picker = {
		enable = true,
		chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
		exclude = {
		  filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
		  buftype  = { "nofile", "terminal", "help", },
		}
	  }
	}
  }
}

require('telescope').load_extension('fzf')

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  indent = {
		enable = true
  },
  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
	-- `false` will disable the whole extension
	enable = true,

	-- list of language that will be disabled
	disable = { },

	-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- Instead of true it can also be a list of languages
	additional_vim_regex_highlighting = false,
  },
}
EOF
end
