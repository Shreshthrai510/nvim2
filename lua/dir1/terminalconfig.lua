vim.o.termguicolors = true
--1vim.opt.shell = 'powershell'
vim.api.nvim_create_user_command('Tirm', function(opts)
            vim.cmd('term powershell')
    end
, { nargs =  0  })
vim.api.nvim_set_keymap('t', '<C-e>', '<C-\\><C-n>', { noremap = true, silent = true })

