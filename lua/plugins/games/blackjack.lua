return {
    "alanfortlink/blackjack.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set(
            "n",
            KeyGroup.games.prefix .. "b",
            ":BlackJackNewGame<CR>",
            { desc = "Blackjack", silent = true }
        )
    end,
}
