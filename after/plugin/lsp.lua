local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

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
