return {
    "luochen1990/rainbow",
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        vim.g.rainbow_active = 1
    end,
}
