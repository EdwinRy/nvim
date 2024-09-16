return {
    "sindrets/diffview.nvim",
    config = function()
        require("diffview").setup({
            default_args = {
                DiffviewOpen = { "--imply-local" },
            },
        })

        vim.keymap.set(
            "n",
            "<leader>0d",
            "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>",
            { desc = "Diff origin/HEAD...HEAD" }
        )
        vim.keymap.set("n", "<leader>0o", "<cmd>DiffviewOpen<cr>", { desc = "DiffviewOpen" })
    end,
}
