return {
    "windwp/nvim-autopairs",
    cond = (function() return not vim.g.vscode end),
    config = function()
        require("nvim-autopairs").setup {}
    end
}
