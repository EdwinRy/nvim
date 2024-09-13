local lsp_zero = require("lsp-zero")

lsp_zero.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lspkind = require("lspkind")

cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer", keyword_length = 1 },
        { name = "luasnip", keyword_length = 1 },
        { name = "nvim_lsp_signature_help" },
    },
})
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
-- vim.cmd('imap <silent><script><expr> <C-j> copilot#Accept("")')
vim.api.nvim_set_keymap("i", "<C-/>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

vim.cmd("let g:copilot_no_tab_map = v:true")

vim.api.nvim_create_user_command("CopilotToggle", function()
    vim.g.copilot_enabled = not vim.g.copilot_enabled
    vim.cmd("Copilot status")
end, { nargs = 0 })

vim.keymap.set("n", "<leader>cp", "<cmd>CopilotToggle<cr>", { noremap = true })

lsp_zero.on_attach(function(client, bufnr)
    vim.keymap.set(
        "n",
        "<leader>lf",
        vim.lsp.buf.format,
        { desc = "Format buffer", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "<leader>ld",
        vim.lsp.buf.definition,
        { desc = "Go to definition", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "<leader>li",
        vim.lsp.buf.implementation,
        { desc = "Got to implementation", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "K",
        vim.lsp.buf.hover,
        { desc = "Show hover information", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "<leader>ls",
        vim.lsp.buf.workspace_symbol,
        { desc = "Workspace symbol", buffer = bufnr, remap = false }
    )
    -- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open float", buffer = bufnr, remap = false })
    vim.keymap.set(
        "n",
        "[d",
        vim.diagnostic.goto_next,
        { desc = "Go to next diagnostic error", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "]d",
        vim.diagnostic.goto_prev,
        { desc = "Go to previous diagnostic error", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "<leader>lc",
        vim.lsp.buf.code_action,
        { desc = "Trigger code actions", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "<leader>lr",
        vim.lsp.buf.references,
        { desc = "List references", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "n",
        "<leader>ln",
        vim.lsp.buf.rename,
        { desc = "Rename symbol", buffer = bufnr, remap = false }
    )
    vim.keymap.set(
        "i",
        "<C-h>",
        vim.lsp.buf.signature_help,
        { desc = "Signature help", buffer = bufnr, remap = false }
    )
end)

lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true,
})
require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "html", "tsserver", "rust_analyzer" },
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

mason_lspconfig.setup_handlers({
    function(server_name)
        -- server_name = server_name == "tsserver" and "ts_ls" or server_name
        require("lspconfig")[server_name].setup({ capabilities = capabilities })
    end,
    ["yamlls"] = function()
        require("lspconfig").yamlls.setup({
            capabilities = capabilities,
            settings = {
                yaml = {
                    schemas = {
                        kubernetes = "/*.yaml",
                        -- Add the schema for gitlab piplines
                        -- ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*.gitlab-ci.yml",
                    },
                },
            },
        })
    end,
})

-- local null_ls = require("null-ls")
-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.prettier.with({
--             extra_args = { "--config", ".prettierrc.json" },
--         }) }
-- })
