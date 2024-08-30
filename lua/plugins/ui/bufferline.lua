return {
    "akinsho/bufferline.nvim",
    version = "v4.6.1",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    after = "catppuccin",
    config = function()
        require("plugin-config.bufferline")
    end,
}
