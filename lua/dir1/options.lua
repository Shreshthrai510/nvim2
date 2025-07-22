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
    if abs_path == "" then
        print("No file to copy path from.")
        return
    end
    copy_to_clipboards(abs_path)
end, {})
-- Command to copy relative path
vim.api.nvim_create_user_command("CopyRelPath", function()
    local rel_path = vim.fn.expand("%")
    if rel_path == "" then
        print("No file to copy path from.")
        return
    end
    copy_to_clipboards(rel_path)
end, {})
