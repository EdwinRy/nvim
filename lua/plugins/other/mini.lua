return {
    "echasnovski/mini.nvim",
    version = "*",
    cond = not vim.g.vscode,
    config = function()
        require("mini.splitjoin").setup({
            mappings = {
                toggle = "gs",
                split = "",
                join = "",
            },
        })

        require("mini.surround").setup({
            mappings = {
                add = "<leader>sa", -- Add surrounding in Normal and Visual modes
                delete = "<leader>sd", -- Delete surrounding
                find = "<leader>sf", -- Find surrounding (to the right)
                find_left = "<leader>sF", -- Find surrounding (to the left)
                highlight = "<leader>sh", -- Highlight surrounding
                replace = "<leader>sc", -- Replace surrounding
                update_n_lines = "<leader>sn", -- Update `n_lines`

                suffix_last = "l", -- Suffix to search with "prev" method
                suffix_next = "n", -- Suffix to search with "next" method
            },
        })

        require("mini.align").setup({
            mappings = {
                align = "ga", -- Align in Normal and Visual modes
                align_visual = "gA", -- Align in Visual mode
            },
        })

        require("mini.cursorword").setup()

        require("mini.pick").setup()
    end,
}
