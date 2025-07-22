require("config.lazy")
require("dir1.tag")
require("dir1.lsp")
require("dir1.gitoption")
require("dir1.remap")
require("dir1.telescope")
require("dir1.options")
--require("dir1.treesitter")
require("dir1.harpoon")


vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- require("mason").setup()
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.opt.guifont = "FiraCode Nerd Font:h12"
vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.keymap.set("n", "<leader>WW", function()
    vim.diagnostic.config({ virtual_text = { severity = vim.diagnostic.severity.ERROR } })
end, { desc = "Show only error diagnostics" })
vim.keymap.set("n", "<leader>WE", function()
    vim.diagnostic.config({ virtual_text = true })
end, { desc = "Show only error diagnostics" })
require("oil").setup({
    columns = { "icon" },
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
})
