require("dir1")
-- vim.cmd[[colorscheme catppuccin-mocha]]
vim.opt.number = true
vim.opt.relativenumber = true
local colorscheme = "tokyonight"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.env.PATH =
    "C:/Users/shreshth.rai/Downloads/ripgrep-14.1.1-x86_64-pc-windows-gnu/ripgrep-14.1.1-x86_64-pc-windows-gnu/" ..
    ";" .. vim.env.PATH
vim.env.PATH =
    "C:/Users/shreshth.rai/Downloads/lazygit_0.52.0_Windows_x86_64/" ..
    ";" .. vim.env.PATH
vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
