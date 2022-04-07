" >> load plugins
call plug#begin('~/.config/nvim/plugged')

	" >> Basic LSP setup and random stuff
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
	" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

	" >> Syntax helpers
	Plug 'alvan/vim-closetag'
	Plug 'jiangmiao/auto-pairs'
	Plug 'mattn/emmet-vim'

	" >> Treeshitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'

	" >> Telescope
	
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'BurntSushi/ripgrep'

	" >> Autocomplete
	
	"Plug 'glepnir/lspsaga.nvim'
	"Plug 'nvim-lua/completion-nvim'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'onsails/lspkind-nvim' "Pictograms for lsp
	Plug 'L3MON4D3/LuaSnip'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

call plug#end()

" colorscheme tokyonight

" settings
syntax on
set number
set relativenumber
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set ruler
set smartindent
set hlsearch
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent
set mouse=a
set completeopt=menuone,noinsert,noselect

" set leader key to ,
let g:mapleader=","

" bindings
inoremap jk <Esc>
nnoremap <Leader>pp <cmd>lua require'telescop.builtin'.builtin{}<CR>

" most recently used files
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <Leader>bfs <cmd>lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

let g:closetag_filenames = '*.html,*.xhtml,*.js,*.ts,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.html,*.js,*.ts,*.tsx'
let g:closetag_filetypes = 'html,xhtml,js,ts,jsx,tsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,ts,tsx,html'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

lua <<EOF
require("treesitter")
require("autocomplete")
require("lsp")
EOF

