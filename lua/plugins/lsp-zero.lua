return {
    "VonHeikemen/lsp-zero.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        require("plugin-config.lsp")
    end,
    dependencies = {

        { "jose-elias-alvarez/null-ls.nvim" },

        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },

        -- LSP status updates
        { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
        {
            "folke/neodev.nvim",
            config = function()
                require("neodev").setup()
            end,
        },
    },
}
