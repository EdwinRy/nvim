return {
    "alanfortlink/blackjack.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set(
            "n",
            "<leader>gb",
            ":BlackJackNewGame<CR>",
            { desc = "Blackjack", silent = true }
        )
    end,
}
