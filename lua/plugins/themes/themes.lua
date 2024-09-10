return {
    { "rose-pine/neovim", name = "rose-pine" },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "0xstepit/flow.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "rebelot/kanagawa.nvim" },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            -- custom options here
        },
        --     config = function(_, opts)
        --         require("tokyodark").setup(opts) -- calling setup is optional
        --         vim.cmd [[colorscheme tokyodark]]
        --     end,
    },
    { "navarasu/onedark.nvim" },
    { "marko-cerovac/material.nvim" },
    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "Mofiqul/vscode.nvim" },
    { "EdenEast/nightfox.nvim" },
}
