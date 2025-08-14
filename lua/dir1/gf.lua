vim.opt.path:append({ '.', './src/' })
vim.opt.suffixesadd:append({ '.js', '.jsx' , '.ts', '.tsx'})

-- Function to load the main Node module
local function load_main_node_module(fname)
    local node_modules_path = './node_modules/'
    local package_json_path = node_modules_path .. fname .. '/package.json'

    if vim.fn.filereadable(package_json_path) == 1 then
        local file_content = vim.fn.readfile(package_json_path)
        local package_json = vim.fn.json_decode(table.concat(file_content, '\n'))
        return node_modules_path .. fname .. '/' .. package_json.main
    else
        return node_modules_path .. fname
    end
end

-- Override the gf command
vim.api.nvim_set_keymap('n', 'gf', ':lua vim.cmd("edit " .. load_main_node_module(vim.fn.expand("<cfile>"))) <CR>', { noremap = true, silent = true })
