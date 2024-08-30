return {
    "akinsho/toggleterm.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    version = "*",
    config = function()
        require("plugin-config.toggleterm")
    end,
}
