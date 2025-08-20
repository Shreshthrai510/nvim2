require("config.lazy")
require("dir1.tag")
require("dir1.gf")
require("dir1.lsp")
require("dir1.gitoption")
require("dir1.remap")
require("dir1.telescope")
require("dir1.options")
require("dir1.terminalconfig")
require("dir1.harpoon")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.g.autoformat = false
require("mason").setup()
require("oil").setup({
    keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
        ["<C-y>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["<C-b>"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<C-b>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.opt.guifont = "FiraCode Nerd Font:h12"
vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.keymap.set("n", "<leader>WW", function()
    vim.diagnostic.config({ virtual_text = { severity = vim.diagnostic.severity.ERROR } })
end, { desc = "Show only error diagnostics" })
vim.keymap.set("n", "<leader>WE", function()
    vim.diagnostic.config({ virtual_text = true })
end, { desc = "Show only error diagnostics" })

local function gettabname()
	local tabnr = vim.api.nvim_get_current_tabpage()
	local tabname = vim.api.nvim_tabpage_get_var(tabnr, 'name')
	return [[Exer]]
end
local function hello()
	local tabnr = vim.api.nvim_get_current_tabpage()
  return tabnr
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'buffers'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'buffers'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
		  lualine_a = {gettabname},
    lualine_b = {hello},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
	},

  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
