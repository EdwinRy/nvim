CWD_only = true

return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            fzf_args = "--wrap",
        })

        -- basic
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "f",
            require("fzf-lua").files,
            { desc = "Search by filename" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "a",
            require("fzf-lua").grep_cword,
            { desc = "Grep current word" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "k",
            require("fzf-lua").builtin,
            { desc = "Select fzf-lua picker" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "g",
            require("fzf-lua").live_grep,
            { desc = "Live grep" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "b",
            require("fzf-lua").buffers,
            { desc = "Search buffers" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "h",
            require("fzf-lua").oldfiles,
            { desc = "Old files" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "q",
            require("fzf-lua").quickfix,
            { desc = "Quickfix" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "/",
            require("fzf-lua").lgrep_curbuf,
            { desc = "Live grep current buffer" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "s",
            require("fzf-lua").resume,
            { desc = "Resume search" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "j",
            require("fzf-lua").jumps,
            { desc = "Jumplist" }
        )

        -- lsp
        vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "d", function()
            require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
        end, { desc = "LSP definitions" })
        vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "e", function()
            require("fzf-lua").lsp_declarations({ jump_to_single_result = true })
        end, { desc = "LSP declarations" })
        vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "t", function()
            require("fzf-lua").lsp_typedefs({ jump_to_single_result = true })
        end, { desc = "LSP typedefs" })
        vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "i", function()
            require("fzf-lua").lsp_incoming_calls({ jump_to_single_result = true })
        end, { desc = "LSP incoming calls" })
        vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "o", function()
            require("fzf-lua").lsp_outgoing_calls({ jump_to_single_result = true })
        end, { desc = "LSP outgoing calls" })
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "c",
            require("fzf-lua").lsp_code_actions,
            { desc = "LSP code actions" }
        )
        vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "r", function()
            require("fzf-lua").lsp_references({ cwd_only = CWD_only })
        end, { desc = "LSP references" })
        vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "m", function()
            require("fzf-lua").lsp_implementations({ jump_to_single_result = true })
        end, { desc = "LSP implementations" })

        -- diagnostics
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "p",
            require("fzf-lua").diagnostics_document,
            { desc = "Document diagnostics" }
        )
        vim.keymap.set(
            "n",
            KeyGroup.fzfLua.prefix .. "w",
            require("fzf-lua").diagnostics_workspace,
            { desc = "Workspace diagnostics" }
        )

        vim.keymap.set(
            { "n", "i", "v" },
            "<C-p>",
            require("fzf-lua").files,
            { desc = "Search by filename" }
        )
        vim.keymap.set(
            { "n", "i", "v" },
            "<C-g>",
            require("fzf-lua").live_grep,
            { desc = "Live grep" }
        )

        -- other
        vim.keymap.set(
            "n",
            "<leader>cft",
            require("fzf-lua").colorschemes,
            { desc = "Colorschemes" }
        )

        vim.keymap.set("n", "<leader>cd", function()
            CWD_only = not CWD_only
            print("LSP search in cwd only: " .. tostring(CWD_only))
        end, { desc = "Toggle CWD only" })
    end,
}
