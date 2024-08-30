return {
    "numToStr/Comment.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    opts = {
        -- add any options here
    },
    lazy = false,
}
