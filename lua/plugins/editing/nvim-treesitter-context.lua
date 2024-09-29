return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>ce",
            ":TSContextToggle<CR>",
            { desc = "Toggle treesitter context" }
        )
    end,
}
