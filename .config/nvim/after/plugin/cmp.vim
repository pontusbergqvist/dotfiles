"if !exists('g:loaded_cmp') | finish | endif

set completeopt=menuone,noinsert,noselect

lua <<EOF
local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
	snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
	},
	sources = {
		{ name = 'nvim_lsp', keyword_length = 4 },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	},
	formatting = {
		format = lspkind.cmp_format {
				with_text = true,
				menu = {
						buffer = '[buf]',
						nvim_lsp = '[LSP]',
						path = '[path]',
						luasnip = '[snip]'
					}
			}
	}, 
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		--['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}
})

-- LSP Setup:
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
	capabilities = capabilities
}

EOF
