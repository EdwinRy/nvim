local function openLazyGitWindowed()
    vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
    vim.cmd("LazyGit")
end

local function openLazyGitFullscreen()
    vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
    vim.cmd("LazyGit")
end

return {
    "kdheepak/lazygit.nvim",
    config = function()
        vim.keymap.set("n", "<leader>0l", openLazyGitWindowed, { desc = "Open lazygit" })
        vim.keymap.set(
            "n",
            "<leader>0k",
            openLazyGitFullscreen,
            { desc = "Open lazygit fullscreen" }
        )
    end,
}
