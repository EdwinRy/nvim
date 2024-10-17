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
            "/",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { forward = true, wrap = false, multi_window = false },
                })
            end,
            desc = "Flash",
        },
        {
            "?",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { forward = false, wrap = false, multi_window = false },
                })
            end,
            desc = "Flash",
        },
        {
            "n",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({ continue = true })
            end,
        },
    },
}
