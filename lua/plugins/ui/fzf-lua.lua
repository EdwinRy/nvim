CWD_only = true

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    -- require("fzf-lua").setup()

    -- basic
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "f", require("fzf-lua").files, { desc = "Search by filename" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "k", require("fzf-lua").builtin, { desc = "Select fzf-lua picker" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "g", require("fzf-lua").live_grep, { desc = "Live grep" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "b", require("fzf-lua").buffers, { desc = "Search buffers" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "h", require("fzf-lua").oldfiles, { desc = "Old files" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "q", require("fzf-lua").quickfix, { desc = "Quickfix" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "/", require("fzf-lua").lgrep_curbuf, { desc = "Live grep current buffer" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "s", require("fzf-lua").resume, { desc = "Resume search" })


    -- lsp
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "d", require("fzf-lua").lsp_definitions, { desc = "LSP definitions" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "e", require("fzf-lua").lsp_declarations, { desc = "LSP declarations" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "t", require("fzf-lua").lsp_typedefs, { desc = "LSP typedefs" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "i", require("fzf-lua").lsp_incoming_calls, { desc = "LSP incoming calls" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "o", require("fzf-lua").lsp_outgoing_calls, { desc = "LSP outgoing calls" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "c", require("fzf-lua").lsp_code_actions, { desc = "LSP code actions" })
    -- vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "r", require("fzf-lua").lsp_references, { desc = "LSP references" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "r", function () require("fzf-lua").lsp_references{cwd_only = CWD_only} end, { desc = "LSP references" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "m", require("fzf-lua").lsp_implementations, { desc = "LSP implementations" })


    -- diagnostics
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "p", require("fzf-lua").diagnostics_document, { desc = "Document diagnostics" })
    vim.keymap.set("n", KeyGroup.fzfLua.prefix .. "w", require("fzf-lua").diagnostics_workspace, { desc = "Workspace diagnostics" })


    vim.keymap.set({"n", "i", "v"}, "<C-p>", require("fzf-lua").files, { desc = "Search by filename" })
    vim.keymap.set({"n", "i", "v"}, "<C-g>", require("fzf-lua").live_grep, { desc = "Live grep" })



    vim.keymap.set("n", "<leader>cd", function()
      CWD_only = not CWD_only
      print("LSP search in cwd only: " .. tostring(CWD_only))
    end, { desc = "Toggle CWD only" })
  end
}
