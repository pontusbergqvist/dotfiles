if has ("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif

" >> load plugins
call plug#begin()

if has("nvim")

	" >> Basic LSP setup and random stuff
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
	"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'norcalli/nvim-colorizer.lua'	
	Plug 'arcticicestudio/nord-vim'

	" >> Statusline
	Plug 'nvim-lualine/lualine.nvim'

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
	
	" >> Nvim-tree
	Plug 'kyazdani42/nvim-tree.lua'	
	Plug 'kyazdani42/nvim-web-devicons'

endif

call plug#end()

