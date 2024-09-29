return {
    "pwntester/octo.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        -- OR 'ibhagwan/fzf-lua',
        "nvim-tree/nvim-web-devicons",
        "folke/which-key.nvim",
    },
    priority = 60,
    config = function()
        require("octo").setup({
            suppress_missing_scope = {
                projects_v2 = true,
            },
            picker = "telescope", -- or "fzf-lua"
            picker_config = {
                use_emojis = true, -- only used by "fzf-lua" picker for now
                mappings = { -- mappings for the pickers
                    open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
                    copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
                    checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
                    merge_pr = { lhs = "<C-r>", desc = "merge pull request" },
                },
            },
            gh_cmd = "gh", -- Command to use when calling Github CLI
            gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
            timeout = 5000, -- timeout for requests between the remote server
            mappings_disable_default = false, -- disable default mappings if true, but will still adapt user mappings
        })
        vim.treesitter.language.register("markdown", "octo")

        local wkMappings = {}
        local octoMappings = require("octo.config").values.mappings
        local lhsTable = {}
        for _, group in pairs(octoMappings) do
            for _, mapping in pairs(group) do
                if
                    string.sub(mapping.lhs, 1, #"<leader>") == "<leader>"
                    and not lhsTable[mapping.lhs]
                then
                    table.insert(wkMappings, { mapping.lhs, desc = mapping.desc })
                    lhsTable[mapping.lhs] = true
                end
            end
        end
        require("which-key").add(wkMappings)

        vim.keymap.set(
            "n",
            "<leader>opl",
            ":Octo pr list<CR>",
            { desc = "List pull requests", silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>opse",
            ":Octo pr search<CR>",
            { desc = "Search pull requests", silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>oprl",
            ":Octo pr reload<CR>",
            { desc = "Reload PR", silent = true }
        )
    end,
}
