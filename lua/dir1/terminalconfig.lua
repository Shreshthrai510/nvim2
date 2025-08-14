vim.o.termguicolors = true
vim.opt.shell = 'powershell'
vim.api.nvim_create_user_command('Tirm', function(opts)
    local has_terminal = false
    local terminal_win_id = nil
    local wins = (vim.api.nvim_list_wins())
    for i = #wins, 1, -1 do
        local win = wins[i]
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
            has_terminal = true
            terminal_win_id = win 
            break
        end
    end
    local arg = opts.args
    print(arg)
    if arg == 'new' then
        if has_terminal  then
            vim.api.nvim_set_current_win(terminal_win_id)
            vim.cmd('vsplit') 
            vim.cmd('wincmd l')
            vim.cmd('term')
            vim.cmd('resize 10') 
            return
        end
        vim.cmd('sp')        
        vim.cmd('wincmd j')  
        vim.cmd('term')      
        vim.cmd('resize 10') 
        return
    elseif arg =="hide" then
            vim.api.nvim_set_current_win(terminal_win_id)
            vim.cmd('resize 0') 
    elseif arg =="show" then
            vim.api.nvim_set_current_win(terminal_win_id)
            vim.cmd('resize 10') 
    end
end, { nargs =  1  })
vim.api.nvim_set_keymap('t', '<C-e>', '<C-\\><C-n>', { noremap = true, silent = true })
