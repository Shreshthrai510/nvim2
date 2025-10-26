vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('svelte')
vim.lsp.enable('tailwindcss')
--local mason_lspconfig = require('mason-lspconfig')
--
---- Auto-install jedi_language_server
--mason_lspconfig.setup({
--	ensure_installed = { 'pyright', 'jedi_language_server' },
--})
--
---- The setup_handlers block remains the same
--mason_lspconfig.setup_handlers({
--	function(server_name)
--		lspconfig[server_name].setup({
--			-- ... (other shared configuration)
--			on_attach = require('lsp-on-attach').on_attach,
--			capabilities = require('cmp_nvim_lsp').default_capabilities(
--				vim.lsp.protocol.make_client_capabilities()
--			),
--		})
--	end,
--})
