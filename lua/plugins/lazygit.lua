return {
    "kdheepak/lazygit.nvim",
    cond = (function() return not vim.g.vscode end),
    config = (function()
        vim.keymap.set("n", "<leader>0l", ":LazyGit<CR>", { desc = "Open lazygit" })
    end)
}

