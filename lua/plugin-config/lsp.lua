local lsp_zero = require("lsp-zero")
-- local null_ls = require("null-ls")

-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.diagnostics.eslint,
--         -- null_ls.builtins.completion.spell,
--         null_ls.builtins.diagnostics.cspell,
--         null_ls.builtins.code_actions.cspell,
--     },
-- })


lsp_zero.preset("recommended")
-- lsp.ensure_installed({
--     'tsserver',
--     -- 'sumneko_lua',
--     'rust_analyzer',
-- })

-- Fix Undefined global 'vim'
-- lsp.configure('sumneko_lua', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })

-- require'lspconfig'.tsserver.setup{
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
--   root_dir = function() return vim.loop.cwd() end
-- }

lsp_zero.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
})
-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
vim.cmd('imap <silent><script><expr> <C-j> copilot#Accept("")')
vim.cmd("let g:copilot_no_tab_map = v:true")

vim.api.nvim_create_user_command('CopilotToggle', function()
    vim.g.copilot_enabled = not vim.g.copilot_enabled
    vim.cmd('Copilot status')
end, { nargs = 0, })

vim.keymap.set('n', '<leader>cp', '<cmd>CopilotToggle<cr>', { noremap = true })


lsp_zero.set_preferences({
    -- suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp_zero.on_attach(function(client, bufnr)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Got to implementation", buffer = bufnr, remap = false })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lo", vim.diagnostic.open_float, { desc = "Open float", buffer = bufnr, remap = false })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic error", buffer = bufnr, remap = false })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic error", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Trigger code actions", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "List references", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr, remap = false })
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = bufnr, remap = false })
end)

lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true,
})

require('mason').setup({})
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = { "lua_ls" },
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
    },
})

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {}
    end,
}
