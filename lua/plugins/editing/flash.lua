return {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {
            mode = "fuzzy",
            incremental = true,
        },
        highlight = {
            -- backdrop = false,
        },
        label = {
            uppercase = false,
            -- reuse = "none",
            -- distance = false,
        },
        jump = {
            -- autojump = true,
        },
        modes = {
            char = {
                enabled = false,
            },
        },
    },
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { forward = true, wrap = false, multi_window = false },
                })
            end,
            desc = "Flash",
        },
        {
            "S",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { forward = false, wrap = false, multi_window = false },
                })
            end,
            desc = "Flash",
        },
        {
            "R",
            mode = { "n" },
            function()
                require("flash").treesitter_search()
            end,
            desc = "Treesitter Flash",
        },
        {
            "r",
            mode = "o",
            function()
                require("flash").remote()
            end,
            desc = "Remote Flash",
        },
        {
            "R",
            mode = { "o", "x" },
            function()
                require("flash").treesitter_search()
            end,
            desc = "Treesitter Search",
        },
        {
            "<leader>c",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({ continue = true })
            end,
        },
    },
}
