if !exists('g:loaded_telescope') | finish | endif

" most recently used files
" nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.buffers{}<CR>

" all files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.find_files{}<CR>

" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" dotfiles
nnoremap <Leader>df <cmd>lua require'telescope.builtin'.find_files({ search_dirs = { "~/.config", "~/.tmux.conf" }, hidden = true })<CR>

" git files
"nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

lua << EOF
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
				},
			},
		}
}
EOF

