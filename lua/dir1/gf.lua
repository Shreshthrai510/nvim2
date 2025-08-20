vim.opt.path:append({ '.', './src/' })
vim.opt.suffixesadd:append({ '.js', '.jsx' , '.ts', '.tsx'})

vim.api.nvim_set_keymap('n', 'gf', ':lua vim.cmd("edit " .. load_main_node_module(vim.fn.expand("<cfile>"))) <CR>', { noremap = true, silent = true })
