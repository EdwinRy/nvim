vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

return {
    "rmagatti/auto-session",
    cond = (function() return not vim.g.vscode end),
    config = function()
        require("auto-session").setup {
            auto_save_enabled = true,
            pre_save_cmds = { "tabdo NvimTreeClose" },
            post_restore_cmds = { "tabdo NvimTreeFindFile" },
            lazy_support = false,

            session_lens = {
                theme_conf = { -- Pass through for Telescope theme options
                    -- layout_config = { -- As one example, can change width/height of picker
                    --   width = 0.8,    -- percent of window
                    --   height = 0.5,
                    -- },
                },
                previewer = false, -- File preview for session picker
            },
        }
        vim.keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, {
            noremap = true, desc = "Search sessions"
        })
        vim.keymap.set("n", "<leader>sd", ":SessionDelete<CR>", { desc = "Delete session", silent = false })
    end
}
