require("dir1")
vim.g.fuzzy = { implementation = 'lua' }
-- vim.cmd[[colorscheme catppuccin-mocha]]
vim.opt.number = true
vim.opt.relativenumber = true
local colorscheme = "brightburn"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = false

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.g.fast_cursor_move_acceleration = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

