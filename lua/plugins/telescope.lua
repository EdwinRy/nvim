local function config()
    require('telescope').setup {
        defaults = {
            mappings = {
                i = {
                    ["<C-o>"] = function(prompt_bufnr)
                        require("telescope.actions").select_default(prompt_bufnr)
                        require("telescope.builtin")
                            .resume()
                    end,
                },
                n = {

                    ["o"] = function(prompt_bufnr)
                        require("telescope.actions").select_default(prompt_bufnr)
                        require("telescope.builtin")
                            .resume({ initial_mode = "normal" })
                    end,
                }
            }
        },
        pickers = {
            find_files = {
                -- hidden = true
                -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "-u" },
            }
        }
    }
    require("telescope").load_extension "session-lens"
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fu', ":Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>", {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>ft', builtin.git_files, {})
    -- vim.keymap.set('n', '<leader>fs', function()
    --     builtin.grep_string({ search = vim.fn.input("Grep > ") });
    -- end)

    require("telescope").load_extension "undo"
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope undo<cr>")


    vim.keymap.set('n', '<leader>fl', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
    vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls, {})
    vim.keymap.set('n', '<leader>fp', builtin.diagnostics, {})
end


return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'debugloop/telescope-undo.nvim'
    },
    cond = (function() return not vim.g.vscode end),
    config = config,
}
