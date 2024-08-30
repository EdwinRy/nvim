return {
    "folke/trouble.nvim",
    cond = (function() return not vim.g.vscode end),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
