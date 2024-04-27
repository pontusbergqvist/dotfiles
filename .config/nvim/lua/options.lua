require "nvchad.options"

vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.relativenumber = true

-- Highlight visual on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 100 }
  end,
})

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd ":Nvdash"
    require("nvim-tree.api").tree.toggle()
  end,
})

-- Close nvim-tree if last buffer
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match "NvimTree_" ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, close all invalid windows.
      for _, w in ipairs(invalid_win) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})
