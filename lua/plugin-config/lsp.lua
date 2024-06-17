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
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>lo", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
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
