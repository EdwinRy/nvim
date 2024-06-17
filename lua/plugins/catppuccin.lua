return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    cond = (function() return not vim.g.vscode end),
    config = function()
        require("plugin-config.theme")
    end
}
