local tabnames = {}
local function gettabname()
	local tabnr = vim.api.nvim_get_current_tabpage()
	local str = '[UTab] '..tabnr
	if #tabnames <tabnr and tabnames[tabnr]==nil then
		tabnames[tabnr] = str
	end
	str = tabnames[tabnr]
	return str
end
--string.sub(tabnames[tabnr],1,1)=='['
local function hello()
	local tabnr = vim.api.nvim_get_current_tabpage()
  return tabnr
end

vim.api.nvim_create_user_command(
  "Tabr",                                -- command name (:MyCmd)
  function(opts)
		local arg = opts.args                 -- get argument
		local tabnr = vim.api.nvim_get_current_tabpage()
		tabnames[tabnr] =arg
  end,
  { nargs = 1 }                           -- requires exactly 1 argument
)
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
    lualine_c = {'tabs'},
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
