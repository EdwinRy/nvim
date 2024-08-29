local function config()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
        on_attach = on_attach,
        filters = {
            dotfiles = false,
            git_ignored = false,
            custom = {
                "^node_modules$",
                "^.terraform",
                "^.terragrunt-cache",
                "^.git$"
            },
        },
        actions = {
            change_dir = {
                global = true,
            },
        },
        view = {
            width = {
                min = 30,
                max = 60,
            },
            -- side = "left",
            adaptive_size = true,
        },
        renderer = {
            indent_markers = {
                enable = true,
            }
        },
        ui = {
            confirm = {
                default_yes = true,
            }
        }
    })

    local api = require("nvim-tree.api")


    vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { desc = "Open nvim-tree with current file focused" })
    -- vim.keymap.set("n", "<leader>pv", ":NvimTreeOpen<CR>", { desc = "Open NvimTree" })
    vim.keymap.set("n", "<leader>cwd", api.tree.change_root_to_parent, { desc = "Change nvim-tree root to cwd" })
    vim.keymap.set("n", "<leader>m", function() api.tree.close() end, { desc = "Close nvim-tree" })
end


return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cond = (function() return not vim.g.vscode end),
    config = config,
    lazy = false
}
