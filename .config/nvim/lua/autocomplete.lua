local cmp = require'cmp'
local lspkind = require'lspkind'
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {}
	server:setup(opts)
end)

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	}, 
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }
		},
		{
			{ name = 'buffer' },
	}),
	mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
	},
	formatting = {
		format = lspkind.cmp_format({with_text = false, maxwidth = 50, mode = 'symbol'})
	}
})

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<tsserver>'].setup {
    capabilities = capabilities
  }

vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
