require "nvchad.mappings"

local tree = require("nvim-tree.api").tree
-- add yours here

local map = vim.keymap.set

-- General mappings
map("i", "jk", "<ESC>", { desc = "Escape to normal mode" })
map("n", "|", ":vsplit <Enter>", { desc = "Open current file in split pane" })

-- Nvim-tree
map("n", "<leader>e", tree.toggle, { desc = "Toggle nvim-tree visibility" })

-- Floating windows and Telescope mappings
map("n", "<leader>f", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })

map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Fuzzy find" })

map("n", "<leader>df", function()
  require("telescope.builtin").find_files { search_dirs = { "~/.config", "~/.tmux.conf" }, hidden = true }
end, { desc = "Find dotfiles" })

map("n", "<leader>sd", function()
  require("telescope.builtin").diagnostics()
end, { desc = "Open diagnostics" })

map("n", "<leader>tt", function()
  require("nvchad.term").new { pos = "float" }
end, { desc = "Open terminal" })

map("n", "<leader>tn", function()
  require("nvchad.term").new { pos = "float", cmd = "node", close_on_exit = true }
end, { desc = "Open terminal" })

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open terminal" })

map("n", "<leader>ld", function()
  vim.diagnostic.open_float()
end, { desc = "Hover line diagnostics" })

map("n", "<leader>gb", function()
  require("telescope.builtin").git_branches()
end)

map("n", "<leader>gc", function()
  require("telescope.builtin").git_commits()
end)

-- maps.n["<leader>g"] = sections.g
-- maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
-- maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end, desc = "Git commits" }
-- maps.n["<leader>gt"] = { function() require("telescope.builtin").git_status() end, desc = "Git status" }
-- maps.n["<leader>f<CR>"] = { function() require("telescope.builtin").resume() end, desc = "Resume previous search" }
-- maps.n["<leader>f'"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" }
-- maps.n["<leader>fa"] = {

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
