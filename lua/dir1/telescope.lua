local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Telescope find in files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, { desc = 'Telescope lsp_document_symbols' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_references, { desc = 'Telescope lsp refrences' })
vim.keymap.set('n', '<leader>bc', builtin.git_bcommits, { desc = 'Telescope colorscheme' })
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_set = require "telescope.actions.set"
local opts = { noremap = true, silent = true }
local tabnm = { "main", "core", "config", "settings", "init", "setup", "global", "frontend", "backend", "api", "database", "auth", "routes", "models", "controllers", "services", "utils", "hooks", "components", "widgets", "dev", "staging", "prod", "local", "testing", "qa", "terminal", "shell", "bash", "zsh", "powershell", "logs", "debug", "ui", "ux", "design", "theme", "colors", "editor", "docs", "notes", "scratch", "draft", "playground", "sandbox", "tmp" }
vim.api.nvim_set_keymap( "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap( "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
local function hello()
		print("hello")
	end
local function colors(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Tabc",
    finder = finders.new_table {
      results = vim.fn.getcompletion("", "color")
    },
    sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
				vim.cmd('Tabc '..selection[1])
        -- vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      actions.toggle_selection:replace(function()
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
				vim.cmd('Tabc '..selection[1])
        -- vim.api.nvim_put({ selection[1] }, "", false, true)
				actions.move_selection_next(prompt_bufnr)
      end)
      return true
    end,
  }):find()
end

local function names(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Tabc",
    finder = finders.new_table {
      results = tabnm
    },
    sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
				vim.cmd('Tabr '..selection[1])
        -- vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      actions.toggle_selection:replace(function()
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
				vim.cmd('Tabr '..selection[1])
        -- vim.api.nvim_put({ selection[1] }, "", false, true)
				actions.move_selection_next(prompt_bufnr)
      end)
      return true
    end,
  }):find()
end
vim.keymap.set('n', '<leader>cc', colors)
vim.keymap.set('n', '<leader>cr', names)
