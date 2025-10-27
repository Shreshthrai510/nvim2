require("config.lazy")
require("dir1.tag")
require("dir1.tabs")
require("dir1.gf")
require("dir1.ff")
require("dir1.lsp")
require("dir1.gitoption")
require("dir1.remap")
require("dir1.telescope")
require("dir1.options")
require("dir1.terminalconfig")
require("dir1.harpoon")
require("dir1.lualine")
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
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
		format = function(diagnostic)
			local max_width = 30
			local message = diagnostic.message
			local lines = {}
			while #message > max_width do
				local space = message:sub(1, max_width):match(".*()%s")
				space = space or max_width
				table.insert(lines, message:sub(1, space))
				message = message:sub(space + 1)
			end
			table.insert(lines, message)
			local virt_lines = ""
			for _, l in ipairs(lines) do
				virt_lines = virt_lines .. "\n" .. l
			end
			return virt_lines
		end,
	},
})
