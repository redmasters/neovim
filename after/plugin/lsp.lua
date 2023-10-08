local lsp = require('lsp-zero')
lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y'] = cmp.mapping.confirm({select = true}),
--	['<CR>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})



lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'golangci_lint_ls',
		'gopls',
		'jdtls',
		'java_language_server',

	},
	handlers = {
		lsp.default_setup, gopls = function()
			require('lspconfig').gopls.setup({
				settings = {
					completions = {
						completeFunctionCalls = true,
					}

				}})
			end,
		},
	})
