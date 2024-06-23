vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup {
            auto_save_enabled = true,
            pre_save_cmds = { "tabdo NvimTreeClose" },
            post_restore_cmds = { "tabdo NvimTreeFindFile" },
        }
        vim.keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, {
            noremap = true,
        })
    end
}
