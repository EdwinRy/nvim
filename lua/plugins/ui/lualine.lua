return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                disabled_filetypes = {
                    statusline = { "packer", "NVimTree" },
                },
                -- globalstatus = true,
                show_filename_only = false,
                path = 1,
            },
        })
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}
