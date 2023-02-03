-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        numbers = true,
        relativenumber = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "U", action = "cd" },
            },
        },
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
    },
    filters = {
        dotfiles = true,
    },
})


local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>n", function()
    vim.cmd([[NvimTreeFindFile]])
end)
vim.keymap.set("n", "<leader>m", function()
    api.tree.close()
end)
