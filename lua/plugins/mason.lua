return {
    "williamboman/mason.nvim",
    config = function()
        require('mason').setup()
        -- local lsp_zero = require("lsp-zero")
        -- local mason_lspconfig = require('mason-lspconfig')
        -- mason_lspconfig.setup({
        --     ensure_installed = { "lua_ls", "html" },
        --     automatic_installation = true,
        --     handlers = {
        --         lsp_zero.default_setup,
        --     },
        -- })
        --
        -- mason_lspconfig.setup_handlers {
        --     function(server_name)
        --         require('lspconfig')[server_name].setup {}
        --     end,
        -- }
    end
}
