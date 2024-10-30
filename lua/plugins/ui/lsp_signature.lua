return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        hint_enable = false,
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)
        vim.keymap.set({ "n", "i" }, "<C-x>k", function()
            require("lsp_signature").toggle_float_win()
        end, { desc = "toggle signature" })
    end,
}
