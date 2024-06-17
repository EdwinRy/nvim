return {
    "nmac427/guess-indent.nvim",
    cond = (function() return not vim.g.vscode end),
    config = function()
        require("guess-indent").setup {}
    end,
}
