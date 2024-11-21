local mocha = require("catppuccin.palettes").get_palette("mocha")

require("bufferline").setup({
    options = {
        numbers = "ordinal",
        themable = true,
        indicator = {
            -- style = "underline",
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        -- sort_by = "insert_after_current",
        -- hover = {
        --     enabled = true,
        --     -- delay = 200,
        --     reveal = { "close" },
        -- },
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
})

Bufferline_loaded = true
vim.keymap.set("n", "<M-]>", ":BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set(
    "n",
    "<M-[>",
    ":BufferLineCyclePrev<CR>",
    { desc = "Previous buffer", silent = true }
)

vim.keymap.set(
    "n",
    "<M-}>",
    ":BufferLineMoveNext<CR>",
    { desc = "Move buffer right", silent = true }
)
vim.keymap.set(
    "n",
    "<M-{>",
    ":BufferLineMovePrev<CR>",
    { desc = "Move buffer left", silent = true }
)

vim.keymap.set(
    "n",
    "<M-1>",
    ":BufferLineGoToBuffer 1<CR>",
    { desc = "Go to buffer 1", silent = true }
)
vim.keymap.set(
    "n",
    "<M-2>",
    ":BufferLineGoToBuffer 2<CR>",
    { desc = "Go to buffer 2", silent = true }
)
vim.keymap.set(
    "n",
    "<M-3>",
    ":BufferLineGoToBuffer 3<CR>",
    { desc = "Go to buffer 3", silent = true }
)
vim.keymap.set(
    "n",
    "<M-4>",
    ":BufferLineGoToBuffer 4<CR>",
    { desc = "Go to buffer 4", silent = true }
)
vim.keymap.set(
    "n",
    "<M-5>",
    ":BufferLineGoToBuffer 5<CR>",
    { desc = "Go to buffer 5", silent = true }
)
vim.keymap.set(
    "n",
    "<M-6>",
    ":BufferLineGoToBuffer 6<CR>",
    { desc = "Go to buffer 6", silent = true }
)
vim.keymap.set(
    "n",
    "<M-7>",
    ":BufferLineGoToBuffer 7<CR>",
    { desc = "Go to buffer 7", silent = true }
)
vim.keymap.set(
    "n",
    "<M-8>",
    ":BufferLineGoToBuffer 8<CR>",
    { desc = "Go to buffer 8", silent = true }
)
vim.keymap.set(
    "n",
    "<M-9>",
    ":BufferLineGoToBuffer 9<CR>",
    { desc = "Go to buffer 9", silent = true }
)
vim.keymap.set(
    "n",
    "<M-0>",
    ":BufferLineGoToBuffer 10<CR>",
    { desc = "Go to buffer 10", silent = true }
)

vim.keymap.set(
    "n",
    "<leader>bc",
    ":BufferLinePickClose<CR>",
    { desc = "Close picked buffer", silent = true }
)
-- vim.keymap.set(
--     "n",
--     "<leader>bz",
--     ":BufferLineCloseOthers<CR>",
--     { desc = "Close all but current buffer", silent = true }
-- )
vim.keymap.set(
    "n",
    "<leader>bg",
    ":BufferLinePick<CR>",
    { desc = "Go to picked buffer", silent = true }
)
