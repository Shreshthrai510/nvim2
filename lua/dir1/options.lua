-- Function to copy text to both Neovim register and system clipboard
local function copy_to_clipboards(text)
    -- Copy to default register and unnamed register
    vim.fn.setreg('"', text)
    vim.fn.setreg('+', text)
    print("Copied: " .. text)
end
-- Command to copy absolute path
vim.api.nvim_create_user_command("CopyPath", function()
    local abs_path = vim.fn.expand("%:p")
	print(abs_path)
    if abs_path == "" then
        print("No file to copy path from.")
        return
    end
    copy_to_clipboards(abs_path)
end, {})
-- Command to copy relative path
vim.api.nvim_create_user_command("CopyRelPath", function()
    local abs_path = vim.fn.expand("%:p")    -- Get the absolute path of the current file
    local current_dir = vim.fn.getcwd()      -- Get the current working directory

    if string.sub(abs_path, 1, #current_dir) == current_dir then
        local rel_path = string.sub(abs_path, #current_dir + 2) 
		copy_to_clipboards('./'..rel_path)
    else
		copy_to_clipboards(abs_path)
    end
end, {})
