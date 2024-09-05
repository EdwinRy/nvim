return {
    "alec-gibson/nvim-tetris",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>9t", ":Tetris<CR>", { desc = "Tetris", silent = true })
    end,
}
