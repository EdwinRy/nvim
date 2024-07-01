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
    vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = "Search files by name with telescope"})
    vim.keymap.set('n', '<leader>fu', ":Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>", {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Search for file content with telescope"})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search buffers with telescope" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search help tags with telescope" })
    vim.keymap.set('n', '<leader>ft', builtin.git_files, { desc = "Search git files with telescope" })

    -- vim.keymap.set('n', '<leader>fs', function()
    --     builtin.grep_string({ search = vim.fn.input("Grep > ") });
    -- end)

    require("telescope").load_extension "undo"
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope undo<cr>")


    vim.keymap.set('n', '<leader>fl', builtin.oldfiles, { desc = "Search old files" })
    vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, { desc = "List incoming calls with telescope" })
    vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls, { desc = "List outgoing calls with telescope" })
    vim.keymap.set('n', '<leader>fp', builtin.diagnostics, { desc = "List diagnostics with telescope" })


    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "List references with telescope" })
    vim.keymap.set('n', '<leader>fm', builtin.lsp_implementations, { desc = "List implementations with telescope" })
    vim.keymap.set('n', '<leader>fe', builtin.lsp_definitions, { desc = "List definitions with telescope"})
    vim.keymap.set('n', '<leader>fy', builtin.lsp_type_definitions, { desc = "List type definitions with telescope" })


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
