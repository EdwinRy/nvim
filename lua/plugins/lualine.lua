return {
    'nvim-lualine/lualine.nvim',
    cond = (function() return not vim.g.vscode end),
    config = function()
        require("plugin-config.lualine")
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    }
}
