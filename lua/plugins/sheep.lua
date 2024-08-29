return {
    'seandewar/killersheep.nvim',
    config = function()
        vim.keymap.set("n", "<leader>gs", ":KillKillKill<CR>", { desc = "Killersheep", silent = true })
    end,
}

