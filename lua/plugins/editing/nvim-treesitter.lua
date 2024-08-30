return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    init = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
            sync_install = false,
            auto_install = true,
        }
        ts_update()
        vim.cmd("TSToggle highlight")
    end,
}
