local utils = require "astronvim.utils"
local is_available = utils.is_available
local ui = require "astronvim.utils.ui"
local maps = { i = {}, n = {}, v = {}, t = {} }
local sections = {
  p = { name = "󰏖 Packages" },
  l = { name = " LSP" },
  u = { name = " UI" },
  b = { name = "󰓩 Buffers" },
  d = { name = " Debugger" },
  g = { name = " Git" },
  S = { name = "󱂬 Session" },
  t = { name = " Terminal" },
}

maps.n["<leader>q"] = false
maps.n["<leader>n"] = false
maps.n["gx"] = false
maps.n["<C-s>"] = false

-- Manage Buffers
maps.n["<leader>2"] =
{ function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
maps.n["<leader>1"] = {
  function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Previous buffer",
}

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>/"] = false
  maps.v["gc"] =
  { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle comment line" }
end


-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>fa"] = false
  maps.n["<leader>fc"] = false
  maps.n["<leader>fC"] = false
  maps.n["<leader>fF"] = false
  maps.n["<leader>fh"] = false
  maps.n["<leader>fk"] = false
  maps.n["<leader>fm"] = false
  maps.n["<leader>fw"] = false
  maps.n["<leader>fW"] = false
  maps.n["<leader>lD"] = false
  -- Comment this out in AstroNvim default config also to disable default behaviour
  maps.n["<leader>f"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" }
  maps.n["<leader>df"] = {
    function() require("telescope.builtin").find_files({ search_dirs = { "~/.config", "~/.tmux.conf" }, hidden = true }) end,
    desc = "Find all dotfiles"
  }
  maps.n["<leader>/"] = {
    function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Fuzzy find"
  }

  maps.n["<leader>l"] = sections.l
  maps.n["<leader>sd"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" }
end

-- Terminal
if is_available "toggleterm.nvim" then
  maps.n["<leader>t"] = sections.t
  maps.n["<leader>tt"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  if vim.fn.executable "lazygit" == 1 then
    maps.n["<leader>g"] = sections.g
    maps.n["<leader>gg"] = { function() utils.toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
    maps.n["<leader>tl"] = false
  end
  if vim.fn.executable "node" == 1 then
    maps.n["<leader>tn"] = { function() utils.toggle_term_cmd "node" end, desc = "ToggleTerm node" }
  end
  maps.n["<leader>tu"] = false
  maps.n["<leader>tf"] = false
  maps.n["<leader>tp"] = false
  maps.n["<leader>th"] = false
  maps.n["<leader>tv"] = false
  maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.t["<F7>"] = maps.n["<F7>"]
  maps.n["<C-'>"] = maps.n["<F7>"]
  maps.t["<C-'>"] = maps.n["<F7>"]
end

return maps
