-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()


require("nvim-tree").setup({
    on_attach = on_attach
})


-- OR setup with some options
-- require("nvim-tree").setup({
--     sort_by = "case_sensitive",
--     view = {
--         adaptive_size = true,
--         relativenumber = true,
--         mappings = {
--             list = {
--                 { key = "u", action = "dir_up" },
--                 { key = "U", action = "cd" },
--             },
--         },
--         width = {
--             max = 45,
--         }
--     },
--     renderer = {
--         -- group_empty = true,
--         indent_markers = {
--             enable = true,
--             inline_arrows = true,
--             icons = {
--                 corner = "└",
--                 edge = "│",
--                 item = "│",
--                 bottom = "─",
--                 none = " ",
--             },
--         },
--     },
--     filters = {
--         dotfiles = true,
--     },
--     hijack_directories = {
--         enable = true,
--         auto_open = true,
--     },
-- })


local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>n", function()
    vim.cmd([[NvimTreeFindFile]])
end)

vim.keymap.set("n", "<leader>pv", function()
    vim.cmd([[NvimTreeOpen]])
end)

vim.keymap.set("n", "<leader>m", function()
    api.tree.close()
end)



local function open_nvim_tree(data)

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
