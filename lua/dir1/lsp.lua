vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('svelte')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('golangci_lint_ls')
vim.lsp.enable('gopls')
vim.o.pumborder = "rounded"
vim.o.complete = ".,o"
vim.o.completeopt = "fuzzy,menuone,noselect"
vim.o.autocomplete = true
vim.o.pumheight = 7

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {})
    end
})

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
