local function getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

local function config()
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    require("telescope").setup({
        defaults = {
            layout_config = {
                preview_cutoff = 1,
            },
            mappings = {
                i = {
                    ["<C-o>"] = function(prompt_bufnr)
                        actions.select_default(prompt_bufnr)
                        require("telescope.builtin").resume()
                    end,
                    -- ["<C-k>"] = actions.delete_buffer,
                    -- ["?"] = actions_layout.toggle_preview,
                },
                n = {

                    ["o"] = function(prompt_bufnr)
                        require("telescope.actions").select_default(prompt_bufnr)
                        require("telescope.builtin").resume({ initial_mode = "normal" })
                    end,
                },
            },
        },
        pickers = {
            find_files = {
                -- hidden = true
                -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "-u" },
            },
        },
    })
    require("telescope").load_extension("session-lens")
    -- vim.cmd("Telescope lsp_references show_line=false")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search by filename" })
    vim.keymap.set(
        "n",
        "<leader>fu",
        ":Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>",
        { desc = "Grep in files unrestricted" }
    )
    vim.keymap.set("n", "<leader>fgr", builtin.live_grep, { desc = "Search for file contents" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search for file contents" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search open buffers" })
    vim.keymap.set("n", "<leader>f?", builtin.help_tags, { desc = "Search help tags" })
    vim.keymap.set("n", "<leader>fgi", builtin.git_files, { desc = "Search git files" })

    vim.keymap.set("n", "<leader>fol", builtin.oldfiles, { desc = "Search old files" })
    vim.keymap.set("n", "<leader>fic", builtin.lsp_incoming_calls, { desc = "List incoming calls" })
    vim.keymap.set("n", "<leader>foc", builtin.lsp_outgoing_calls, { desc = "List outgoing calls" })
    vim.keymap.set("n", "<leader>fp", builtin.diagnostics, { desc = "List diagnostics" })

    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "List references" })
    vim.keymap.set(
        "n",
        "<leader>fim",
        builtin.lsp_implementations,
        { desc = "List implementations" }
    )
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "List definitions" })
    vim.keymap.set(
        "n",
        "<leader>ft",
        builtin.lsp_type_definitions,
        { desc = "List type definitions" }
    )

    -- vim.keymap.set('n', '<leader>fs', builtin.treesitter, { desc = "List treesitter symbols" })
    -- vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, { desc = "List workspace symbols" })
    vim.keymap.set(
        "n",
        "<leader>/",
        builtin.current_buffer_fuzzy_find,
        { desc = "Fuzzy find in current buffer" }
    )

    vim.keymap.set("v", "<leader>fv", function()
        builtin.live_grep({ default_text = getVisualSelection() })
    end, { desc = "Live grep for selected text" })

    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope undo<cr>")
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
    },
    cond = function()
        return not vim.g.vscode
    end,
    config = config,
}
