local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Telescope lsp_document_symbols' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_implementations, { desc = 'Telescope lsp_document_symbols' })
vim.keymap.set('n', '<leader>col', builtin.colorscheme, { desc = 'Telescope colorscheme' })

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap( "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap( "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
