require "nvchad.options"

-- add yours here!

vim.o.cursorlineopt = "both" -- to enable cursorline!

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
