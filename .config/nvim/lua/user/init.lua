return {
  polish = function()
    vim.cmd [[ highlight Normal ctermbg=none guibg=none ]]
    vim.cmd [[ highlight SignColumn ctermbg=none guibg=none ]]
  end
}
