return {
    "kdheepak/lazygit.nvim",
    config = function()
        vim.keymap.set("n", "<leader>0l", ":LazyGit<CR>", { desc = "Open lazygit" })
    end,
}
