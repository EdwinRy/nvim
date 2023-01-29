vim.opt.spell = true
vim.opt.spelllang = { 'en_gb' }
vim.opt.spelloptions = "camel"


require('cmp').setup({
    sources = {
        {
            name = 'spell',
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
            },
        },
    },
})
