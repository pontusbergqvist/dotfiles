" >> Settings
syntax on
set number
set relativenumber
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set ruler
set smartindent
set hlsearch
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent
set mouse=a
set completeopt=menuone,noselect,noinsert
set termguicolors


" >> Imports
runtime ./plug.vim
runtime ./maps.vim

" Set colorscheme to nord and remove background for transparency
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE
