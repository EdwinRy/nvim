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

local function config()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- empty setup using defaults
    -- require("nvim-tree").setup()


    require("nvim-tree").setup({
        on_attach = on_attach,
        filters = {
            dotfiles = false,
            git_ignored = false,
            custom = { "node_modules", ".git" },
        },
    })

    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<leader>n", function()
        vim.cmd([[NvimTreeFindFile]])
    end)

    vim.keymap.set("n", "<leader>pv", function()
        vim.cmd([[NvimTreeOpen]])
    end)

    vim.keymap.set(
        "n", "<leader>cwd",
        api.tree.change_root_to_parent,
        { desc = "Change nvim-tree root to cwd" })

    vim.keymap.set("n", "<leader>m", function()
        api.tree.close()
    end)

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end


return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cond = (function() return not vim.g.vscode end),
    config = config,
    lazy=false
}

