return {
    { import = "plugins.editing" },
    { import = "plugins.ui", cond = not vim.g.vscode },
    { import = "plugins.themes", cond = not vim.g.vscode },
    { import = "plugins.integrations", cond = not vim.g.vscode },
    { import = "plugins.games", cond = not vim.g.vscode },
    { import = "plugins.other", cond = not vim.g.vscode },
}
