return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>tsc",
            ":TSContextToggle<CR>",
            { desc = "Toggle treesitter context" }
        )
    end,
}
