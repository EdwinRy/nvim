return {
    'OXY2DEV/markview.nvim',
    cond = (function() return not vim.g.vscode end),
    config = function()
        vim.keymap.set("n", "<leader>vm", ":Markview<CR>", { desc = "Toggle markdown preview", silent = true })
    end,
    dependencies = {
        -- You may not need this if you don't lazy load
        -- Or if the parsers are in your $RUNTIMEPATH
        "nvim-treesitter/nvim-treesitter",

        "nvim-tree/nvim-web-devicons"
    },
}
