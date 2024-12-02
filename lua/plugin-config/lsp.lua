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

local lspKindExists, lspkind = pcall(require, "lspkind")

cmp.setup({
    formatting = {
        format = lspKindExists
            and lspkind.cmp_format({
                mode = "symbol_text", -- show only symbol annotations
                maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                -- can also be a function to dynamically calculate max width such as
                -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                ellipsis_char = "...",    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            })
            or nil,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-a>"] = cmp.mapping({
            i = function()
                if cmp.visible() then
                    cmp.abort()
                else
                    cmp.complete()
                end
            end,
            c = function()
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end,
        }),
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
        {
            name = "nvim_lsp",
            keyword_length = 0,
            entry_filter = function(entry, ctx)
                return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
            end,
        },
        {
            name = "buffer",
            keyword_length = 0,
            entry_filter = function(entry, ctx)
                return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
            end,
        },
        { name = "luasnip", keyword_length = 0 },
        -- { name = "nvim_lsp_signature_help" },
    },
    completion = {
        keyword_length = 0,
    },
})
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

vim.api.nvim_set_keymap("i", "<C-/>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-'>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.keymap.set("i", "<M-;>", "<Plug>(copilot-accept-word)")

-- vim.g.copilot_no_tab_map = true

vim.cmd("let g:copilot_no_tab_map = v:true")
vim.cmd("let g:copilot_no_s_tab_map = v:true")

vim.api.nvim_create_user_command("CopilotToggle", function()
    vim.g.copilot_enabled = not vim.g.copilot_enabled
    vim.cmd("Copilot status")
end, { nargs = 0 })

vim.keymap.set("n", "<leader>cp", "<cmd>CopilotToggle<cr>", { noremap = true })

lsp_zero.on_attach(function(client, bufnr)
    vim.keymap.set(
        "n",
        "<leader>ll",
        function() vim.cmd("LspRestart") end,
        { desc = "Restart LSP Server", buffer = bufnr, remap = false }
    )
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
        "<leader>lm",
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "html", "ts_ls", "rust_analyzer" },
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
        ["omnisharp"] = function()
            require("lspconfig").omnisharp.setup({
                handlers = {
                    ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
                    ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
                    ["textDocument/references"] = require("omnisharp_extended").references_handler,
                    ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
                },
            })
        end,
        ["eslint"] = function()
            require("lspconfig").eslint.setup({
                capabilities = capabilities,
                flags = {
                    allow_incremental_sync = false,
                    debounce_text_changes = 1000,
                },
                settings = {
                    run = "onSave",
                },
            })
        end,
    },
})
