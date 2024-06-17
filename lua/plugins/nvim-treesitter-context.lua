return {
    "nvim-treesitter/nvim-treesitter-context",
    cond = (function() return not vim.g.vscode end),
}
