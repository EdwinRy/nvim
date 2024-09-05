return {
    'seandewar/killersheep.nvim',
    config = function()
        vim.keymap.set("n", "<leader>9s", ":KillKillKill<CR>", { desc = "Killersheep", silent = true })
    end,
}

